# Imagen de Apache basada en Ubuntu (arquitectura Debian, soporta a2ensite)
FROM ubuntu/apache2:latest

# Cambiar el puerto por defecto a uno nuevo (67) modificando ports.conf
RUN sed -i 's/Listen 80/Listen 67/' /etc/apache2/ports.conf


