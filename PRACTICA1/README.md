# PRACTICA1
## HUGO LUCENA MARISCAL
Dominios ficticios escogidos (es mi nombre y es facil de recordar):
* hugo.iaw.net
* lucena.iaw.local
<br>
Puerto interno en el que Apache escuchara dentro de su contenedor: 67
<br>
<br>
# Explicación de la Práctica

Antes de comenzar con la **Fase I**, es necesario configurar el entorno en Docker. Para ello, he creado la siguiente estructura de carpetas y archivos:

![Estructura de carpetas](ruta/a/la/imagen.png)

### Descripción de la estructura:
* **`PRACTICA1/`**: Carpeta principal donde se aloja toda la configuración del Docker.
* **`docker-compose.yml`**: Archivo de configuración que le indica a Docker qué contenedores/máquinas crear y bajo qué reglas.
* **`apache/conf/vhosts.conf`**: Archivo de configuración personalizado para Apache. Define las reglas para que Apache gestione los dominios (gestión a nivel de servidor web, no de Docker). Al estar alojado en el *host*, se puede editar directamente sin entrar al contenedor (los cambios se aplican automáticamente reiniciando con `docker-compose restart`).
* **`/www`**: Raíz pública del servidor web (equivalente tradicionalmente a `/var/www/html` o `htdocs`).
  * **`hugo.iaw.net/`** y **`lucena.iaw.local/`**: Directorios para separar físicamente los archivos de cada sitio web.

---

## Configuración de Archivos

### 1. Configurando `Dockerfile`
Este archivo se encarga de preparar la imagen base de Apache sobre Ubuntu y aplicar los cambios de configuración del puerto y los *Virtual Hosts* durante la fase de construcción (*build*), evitando tener que realizar estos pasos en cada arranque.

![Dockerfile](ruta/a/la/imagen.png)

> **Nota:** El parámetro `RUN` se utiliza para indicarle a la máquina que ejecute comandos en la fase de creación de la imagen.

---

### 2. Configurando `docker-compose.yml`
En lugar de ejecutar comandos extensos en la terminal, el archivo `docker-compose.yml` permite definir la configuración de la infraestructura virtualizada dentro de un archivo de texto estructurado.

![docker-compose.yml](ruta/a/la/imagen.png)

> Los **volúmenes** permiten a los contenedores acceder y utilizar archivos físicos ubicados en el equipo *host*.

---

### 3. Configurando `vhosts.conf`
Permite almacenar y gestionar distintas páginas web. Este archivo se carga en el contenedor gracias a la configuración de volúmenes establecida en `docker-compose.yml`.

![vhosts.conf](ruta/a/la/imagen.png)

*(En el mismo directorio se encuentra el archivo de configuración para el otro servidor).*

---

# FASE I

Con la estructura previa lista, procedemos a iniciar Docker. 

> **Aviso sobre persistencia y cambios:**
> * Si se modifican los archivos `docker-compose.yml` o `Dockerfile`, puede ser necesario reconstruir/recrear el contenedor. Esto no supone un riesgo de pérdida de datos, ya que la mayoría de modificaciones se realizan en el *host* a través de los volúmenes.
> * El archivo `vhosts.conf` y los archivos `index` de cada servidor se pueden editar directamente desde el *host* sin problema, ya que están montados como volúmenes. Si el contenedor está en ejecución al modificar `vhosts.conf`, solo se requiere reiniciar el servicio para aplicar los cambios.

![Inicio de Docker](ruta/a/la/imagen.png)

![Verificación de servicios](ruta/a/la/imagen.png)

---

## Protección de Archivos Sensibles e Internos

Se ha creado un archivo de configuración para el dominio `lucena.iaw.local`:

![Archivo de configuración](ruta/a/la/imagen.png)

Para proteger este archivo, se han añadido las siguientes directivas dentro del bloque de configuración del dominio en `vhosts.conf`:

![Configuración de protección en vhosts.conf](ruta/a/la/imagen.png)

### Explicación de las directivas:

1. **`Options -Indexes`**
   Cuando se accede a un directorio que no contiene un archivo `index.html`, Apache por defecto lista todos los archivos del directorio. Esta opción deshabilita el listado de directorios para evitar la exposición imprevista de archivos.
   
   ![Options -Indexes](ruta/a/la/imagen.png)

2. **`<Files "configurar.php"> Require all denied </Files>`**
   Impide el acceso directo al archivo a través de la URL (ej. `http://lucena.iaw.local/configurar.php`).

---

## Creación del Dominio Fantasma ("Default Host")

Si por un error de red o resolución DNS una petición imprevista llega a la IP del servidor, Apache respondería sirviendo la web configurada en el primer bloque del archivo `vhosts.conf` (por ejemplo, si `nohugo.com` apuntara a la IP, mostraría `hugo.iaw.net`).

Para prevenir esto, se añade un bloque genérico al principio del archivo `vhosts.conf` que actúa como "muro de contención" (*Catch-all / Default VirtualHost*):

![Dominio fantasma](ruta/a/la/imagen.png)

---

## Verificación de Contenido por Dominio (`curl`)

![Comprobación curl 1](ruta/a/la/imagen.png)

![Comprobación curl 2](ruta/a/la/imagen.png)

---

# FASE II

## Certificados y Claves

Para habilitar HTTPS en la web se requiere una **clave privada** (custodiada únicamente por el servidor) y un **certificado público** (que valida la identidad del dominio, ej. `hugo.iaw.net`). Se utiliza **ECDSA**, el estándar moderno basado en curvas elípticas.

1. Dentro de la carpeta del proyecto, se crea el directorio `certificados/`.
2. Se genera la clave privada utilizando ECDSA:

![Generación de clave privada ECDSA](ruta/a/la/imagen.png)

> **Comandos utilizados:**
> * `openssl`: Herramienta criptográfica general.
> * `ecparam`: Indica que se trabajará con parámetros de curvas elípticas.
> * `-genkey`: Ordena la generación de una nueva clave criptográfica.
> * `-name prime256v1`: Especifica la curva ECDSA estándar exigida por su alta eficiencia y nivel de seguridad.

3. Se genera el certificado digital autofirmado utilizando la clave privada:

![Generación del certificado autofirmado](ruta/a/la/imagen.png)

> **Parámetros:**
> * `req`: Gestión y creación de solicitudes de certificados.
> * `-new`: Genera una nueva solicitud.
> * `-x509`: Emitir directamente un certificado autofirmado en lugar de una petición CSR.

---

## Protocolos y Certificados en Nginx

1. Se crea el archivo de configuración para Nginx (`nimbus.conf`):

![Configuración nimbus.conf](ruta/a/la/imagen.png)

2. Se añade el servicio del proxy inverso Nginx en `docker-compose.yml`:

![Servicio proxy en docker-compose](ruta/a/la/imagen.png)

---

## Redirección Automática a HTTPS

Para redirigir todo el tráfico del puerto 80 (HTTP) al puerto 443 (HTTPS), se añade un bloque `server` adicional en la configuración de Nginx escuchando en el puerto 80 y devolviendo la redirección con `$host` y `$request_uri`:

![Redirección HTTP a HTTPS](ruta/a/la/imagen.png)

> Se mapea el puerto `80:80` en el servicio `proxy` dentro de `docker-compose.yml`.

---

## Importancia de la Cabecera `Host`

Durante las pruebas, se eliminan temporalmente las cabeceras en el archivo de configuración de Nginx:

![Cabeceras borradas](ruta/a/la/imagen.png)

![Configuración sin cabeceras](ruta/a/la/imagen.png)

Se reinicia únicamente el contenedor del proxy:
```bash
docker compose restart proxy
