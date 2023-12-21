#!/bin/bash

#  environment variable DOCKER_USERNAME dan GITHUB_TOKEN telah ditetapkan
export DOCKER_USERNAME=imamlabs
export GITHUB_TOKEN=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

LABEL org.opencontainers.image.source=https://github.com/imamlabs/item-app
# Perintah untuk membuat Docker image dari Dockerfile
docker build -t item-app:v1 .

# Melihat daftar image di lokal
docker images

# Mengubah nama image agar sesuai dengan format GitHub Packages
docker tag item-app:v1 ghcr.io/$DOCKER_USERNAME/item-app:v1



# Login ke GitHub Packages menggunakan token sebagai password
echo $GITHUB_TOKEN | docker login ghcr.io -u $DOCKER_USERNAME --password-stdin

# Mengunggah image ke GitHub Packages
docker push ghcr.io/$DOCKER_USERNAME/item-app:v1
