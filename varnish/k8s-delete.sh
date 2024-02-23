#!/bin/bash
kubectl delete ingress varnish-ingress -n varnish
kubectl delete deployment varnish-proxy -n varnish
kubectl delete service varnish-svc -n varnish
kubectl delete service nginx -n varnish
kubectl delete deployment nginx -n varnish
kubectl delete configmap varnish-vcl -n varnish
kubectl delete secret varnish-secret -n varnish
kubectl delete namespace varnish