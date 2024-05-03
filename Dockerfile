# Usa una imagen base 
FROM nginx

# Copia el archivo HTML y la imagen al directorio de trabajo de nginx
COPY main.html /usr/share/nginx/html/

# Expone el puerto 80 para que el servidor web de nginx sea accesible desde fuera del contenedor
EXPOSE 80
