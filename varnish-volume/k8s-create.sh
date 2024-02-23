#!/bin/bash
kubectl create namespace varnish-volume
kubectl apply -f nginx.yaml
kubectl create configmap varnish-vcl -n varnish-volume --from-file=default.vcl
kubectl create secret generic varnish-secret -n varnish-volume --from-literal=secret=$(head -c32 /dev/urandom  | base64)
kubectl apply -f volume-varnish.yaml
kubectl apply -f pv-claim.yaml
kubectl apply -f varnish.yaml