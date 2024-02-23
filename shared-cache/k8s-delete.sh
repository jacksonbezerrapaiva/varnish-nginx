#!/bin/bash
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