#!/bin/bash

# Start Minikube
minikube start

# Deploy MongoDB backend
kubectl apply -f mongodb -f backend

minikube ip

kubectl get services
# Deploy Frontend
kubectl apply -f frontend

# Check the status
kubectl get pods


# Open frontend service in default web browser
minikube service karsajobs-ui-service
