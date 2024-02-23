#!/bin/bash
kubectl create namespace varnish
kubectl apply -f nginx.yaml
kubectl create configmap varnish-vcl -n varnish --from-file=default.vcl
kubectl create secret generic varnish-secret -n varnish --from-literal=secret=$(head -c32 /dev/urandom  | base64)
kubectl apply -f varnish.yaml