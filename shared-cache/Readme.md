# Create configuration

Create configuration

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

## Execute

```sh
kubectl create namespace varnish-cache
kubectl apply -f nginx.yaml
kubectl create secret generic varnish-secret -n varnish-cache --from-literal=secret=$(head -c32 /dev/urandom  | base64)
kubectl create serviceaccount kube-httpcache -n varnish-cache
kubectl apply -f rbac.yaml
kubectl create rolebinding kube-httpcache --clusterrole=kube-httpcache --serviceaccount=varnish-cache:kube-httpcache -n varnish-cache
kubectl apply -f varnish-config-map.yaml
kubectl apply -f varnish-stateful.yaml
kubectl apply -f varnish-service.yaml
kubectl apply -f varnish-ingress.yaml
```

## Delete Cluster

```sh
kubectl delete ingress varnish-ingress -n varnish-cache
kubectl delete service varnish-svc -n varnish-cache

kubectl delete statefulsets cache-statefulset -n varnish-cache
kubectl delete service nginx -n varnish-cache
kubectl delete deployment nginx -n varnish-cache
kubectl delete configmap varnish-vcl -n varnish-cache
kubectl delete secret varnish-secret -n varnish-cache
kubectl delete serviceaccount kube-httpcache -n varnish-cache
kubectl delete -f rbac.yaml
kubectl delete rolebinding kube-httpcache -n varnish-cache
kubectl delete namespace varnish-cache
```

## Log

```sh
kubectl port-forward service/cache-service 8090:80
varnishncsa -c -F "%{VSL:VCL_Log:req.backend_hint}x"
varnishadm backend.list
```


Frontend:
{Address:0.0.0.0 Port:8080 Watch:true Namespace:varnish-cache Service:cache-service PortName:http} 


Backend:
{Watch:true Namespace:varnish-cache Service:nginx Port: PortName:portnginx}


kubectl port-forward service/nginx 8000:80 -n varnish-cache
