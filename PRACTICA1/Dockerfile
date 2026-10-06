#Imagen de Apache basada en Alpine
FROM httpd:alpine 

#Cambiar el puerto por defecto a uno nuevo (67)
RUN sed -i 's/Listen 80/Listen 67/' /usr/local/apache2/conf/httpd.conf 

#Decirle a apache que lea las configuraciones extra de vhosts.conf
RUN echo 'Include conf/extra/httpd-vhosts.conf' >> /usr/local/apache2/conf/httpd.conf
