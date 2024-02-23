#!/bin/bash
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