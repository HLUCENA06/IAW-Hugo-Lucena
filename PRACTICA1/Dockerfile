# Imagen de Apache basada en Ubuntu
FROM ubuntu/apache2:latest

# Cambiar el puerto por defecto a uno nuevo (67) modificando ports.conf
RUN sed -i 's/Listen 80/Listen 67/' /etc/apache2/ports.conf

# Copiar la carpeta con los 3 archivos (.conf) al contenedor
COPY ./apache/conf/ /etc/apache2/sites-available/

# Apagar la web por defecto de Ubuntu
RUN a2dissite 000-default.conf

# Encender las tres webs automáticamente
RUN a2ensite bloqueo.conf hugo.conf lucena.conf

