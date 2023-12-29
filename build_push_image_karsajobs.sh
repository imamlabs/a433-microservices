#!/bin/bash

# Set GitHub username
GITHUB_USERNAME=imamlabs
# Set GitHub token
GITHUB_TOKEN=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

# Build Docker image untuk karsajobs backend
docker build -t ghcr.io/$GITHUB_USERNAME/karsajobs:latest -f Dockerfile .

# Login to GitHub Package Registry menggunakan token
echo $GITHUB_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Push Docker image to GitHub Package Registry
docker push ghcr.io/$GITHUB_USERNAME/karsajobs:latest

