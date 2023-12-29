#!/bin/bash
# Header shebang, menunjukkan bahwa ini adalah skrip Bash.

# Start Minikube
minikube start

# Deploy MongoDB backend
kubectl apply -f mongodb -f backend

# Menampilkan alamat IP Minikube
minikube ip

# Menampilkan layanan yang aktif
kubectl get services

# Deploy Frontend
kubectl apply -f frontend

# Cek status pod
kubectl get pods

# Membuka layanan frontend di browser default
minikube service karsajobs-ui-service
