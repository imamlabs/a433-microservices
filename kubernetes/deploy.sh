#!/bin/bash

NAMESPACE="rabbit"

# Check if the namespace exists
if kubectl get namespace $NAMESPACE &> /dev/null; then
    echo "Namespace $NAMESPACE already exists."
else
    echo "Creating namespace $NAMESPACE..."
    kubectl create namespace $NAMESPACE
fi

# Deploy RabbitMQ
kubectl apply -f rabbit-kubernetes.yaml

# Wait for RabbitMQ to be ready (replace "rabbitmq" with your actual service name)
until kubectl get pods -n $NAMESPACE | grep rabbitmq | grep Running; do
    echo "Waiting for RabbitMQ to be ready..."
    sleep 5
done

# Deploy Order Service
kubectl apply -f order-kubernetes.yaml

# Deploy Shipping Service
kubectl apply -f shipping-kubernetes.yaml

echo "All services deployed successfully."
