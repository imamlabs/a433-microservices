#!/bin/bash

# Pastikan environment variable GITHUB_TOKEN telah ditetapkan
export DOCKER_USERNAME=imamlabs
export GITHUB_TOKEN=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
# Gantilah "<token_GitHub_Anda>" dengan token GitHub Anda

# Login ke GitHub Container Registry menggunakan token sebagai password
echo $GITHUB_TOKEN | docker login ghcr.io -u DOCKER_USERNAME --password-stdin
# Gantilah "USERNAME" dengan nama pengguna GitHub Anda

# Menjalankan docker-compose
docker-compose up -d > log.txt 2>&1
