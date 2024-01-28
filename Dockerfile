# Gunakan base image yang mengandung Node.js (14.21-alpine)
FROM node:14.21-alpine

# Set working directory di dalam container
WORKDIR /app

# Salin seluruh kode aplikasi order service
COPY . .

# Salin file .env ke dalam container
COPY .env .

# Install dependensi
RUN npm install

# Expose port yang digunakan oleh order service
EXPOSE 3000

# Set environment variable AMQP_URL (sesuaikan dengan kebutuhan)
ENV AMQP_URL="amqp://guest:guest@rabbitmq:5672"

# Perintah untuk memeriksa keberadaan file .env di dalam container
RUN ls -la

# Perintah untuk menjalankan order service menggunakan npm
CMD ["node", "index.js"]
