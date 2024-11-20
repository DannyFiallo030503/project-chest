# Usa Node.js como base
FROM node:18-alpine

# Define el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copia solo los archivos necesarios para instalar las dependencias
COPY package*.json ./

# Instala las dependencias dentro del contenedor
RUN npm install

# Copia el resto de los archivos del proyecto
COPY ./src ./src

# Expone el nuevo puerto (5432)
EXPOSE 5432

# Comando para iniciar el servidor en el puerto 5432
CMD ["npx", "http-server", "src", "-p", "5432"]
