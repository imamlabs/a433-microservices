# Gunakan base image yang mengandung Node.js (l14.21-alpine)
FROM node:14.21-alpine

# Set working directory di dalam container
WORKDIR /app

# Salin seluruh kode aplikasi order service
COPY . .

# Salin file .env ke dalam container
COPY .env .

# Install dependensi
RUN npm install

# Expose port yang digunakan oleh shipping service
EXPOSE 3001

# Set environment variable AMQP_URL (sesuaikan dengan kebutuhan)
ENV AMQP_URL="amqp://guest:guest@rabbitmq:5672"

# Perintah untuk menjalankan order service menggunakan npm
CMD ["node", "index.js"]
