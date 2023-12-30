#!/bin/bash
#catatan bisi poho..bro!
# Download dan install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Menambahkan repository Helm untuk Prometheus
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Membuat namespace 'monitoring'
kubectl create namespace monitoring

# Menginstal Prometheus menggunakan Helm
helm install prometheus prometheus-community/prometheus --namespace monitoring

# Menambahkan repository Helm untuk Grafana
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

# Menginstal Grafana menggunakan Helm
helm install grafana grafana/grafana --namespace monitoring

# Mengekspos Prometheus sebagai NodePort
kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-np -n monitoring

# Menampilkan informasi pods di namespace 'monitoring'
kubectl get pods -n monitoring

# Menampilkan Prometheus melalui Minikube Service
minikube service prometheus-server-np -n monitoring

# Mengekspos Grafana sebagai NodePort
kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-np -n monitoring

# Mendapatkan dan men-decode password admin Grafana
kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
