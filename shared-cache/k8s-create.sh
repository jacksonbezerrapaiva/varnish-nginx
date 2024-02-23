#!/bin/bash
alias kubectl="minikube kubectl --"
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