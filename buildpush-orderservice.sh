# Set GitHub username
GITHUB_USERNAME=imamlabs
# Set GitHub token
GITHUB_TOKEN=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

# Build Docker image untuk order service

docker build --no-cache -t ghcr.io/$GITHUB_USERNAME/order-service:latest -f Dockerfile .

# Login ke GitHub Package Registry menggunakan token
echo $GITHUB_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin
# Push Docker image ke GitHub Package Registry
docker push ghcr.io/$GITHUB_USERNAME/order-service:latest
