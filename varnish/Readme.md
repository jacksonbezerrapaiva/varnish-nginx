# Create configuration

Create configurations

# Requirements

- Minikube

## Configure Minikube

```sh
alias kubectl="minikube kubectl --"
minikube start
minikube addons enable metrics-server
minikube addons enable ingress
minikube dashboard
```

## Create

```sh
kubectl create namespace varnish
kubectl apply -f nginx.yaml
kubectl create configmap varnish-vcl -n varnish --from-file=default.vcl
kubectl create secret generic varnish-secret -n varnish --from-literal=secret=$(head -c32 /dev/urandom  | base64)
kubectl apply -f varnish.yaml
```

## Delete Cluster

```sh
kubectl delete ingress varnish-ingress -n varnish
kubectl delete deployment varnish-proxy -n varnish
kubectl delete service varnish-svc -n varnish
kubectl delete service nginx -n varnish
kubectl delete deployment nginx -n varnish
kubectl delete configmap varnish-vcl -n varnish
kubectl delete secret varnish-secret -n varnish
kubectl delete namespace varnish
```