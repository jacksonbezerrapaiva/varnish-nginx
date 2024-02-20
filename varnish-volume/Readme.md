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
kubectl create namespace varnish-volume
kubectl apply -f nginx.yaml
kubectl create configmap varnish-vcl -n varnish-volume --from-file=default.vcl
kubectl create secret generic varnish-secret -n varnish-volume --from-literal=secret=$(head -c32 /dev/urandom  | base64)
kubectl apply -f volume-varnish.yaml
kubectl apply -f pv-claim.yaml
kubectl apply -f varnish.yaml
```

## Delete Cluster

```sh
kubectl delete ingress varnish-ingress -n varnish-volume
kubectl delete deployment varnish-proxy -n varnish-volume
kubectl delete service varnish-svc -n varnish-volume
kubectl delete service nginx -n varnish-volume
kubectl delete deployment nginx -n varnish-volume
kubectl delete configmap varnish-vcl -n varnish-volume
kubectl delete secret varnish-secret -n varnish-volume
kubectl delete pvc task-pv-claim -n varnish-volume
kubectl delete pv pv-volume-varnish -n varnish-volume
kubectl delete namespace varnish-volume
```



