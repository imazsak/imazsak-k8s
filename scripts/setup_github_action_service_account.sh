#!/bin/bash
NAMESPACE=
kubectl create serviceaccount github-action && \
kubectl create rolebinding github-action --serviceaccount=$(NAMESPACE)github-action --clusterrole=admin && \
echo `kubectl get secret $(kubectl get secret | grep github-action | awk '{print $1}') -o json | jq -r '.data.token' | base64 -d`
