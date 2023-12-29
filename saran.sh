curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
$ chmod 700 get_helm.sh
$ ./get_helm.sh
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

kubectl create namespace monitoring
helm install prometheus prometheus-community/prometheus --namespace monitoring
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install grafana grafana/grafana --namespace monitoring
kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-np -n monitoring
kubectl get pods -n monitoring
minikube service prometheus-server-np -n monitoring
kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-np -n monitoring
kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
fMjsMPuqHFTBUMEg7DsWyTLg1S6VXunAUhYnEVjo

