#!/bin/bash
USERNAME=
TOKEN=
kubectl delete secret --ignore-not-found github-docker-login && \
kubectl create secret docker-registry github-docker-login \
  --docker-server=docker.pkg.github.com \
  --docker-username="${USERNAME}" \
  --docker-password="${TOKEN}" \
  --docker-email="" && \
kubectl patch serviceaccount default -p '{"imagePullSecrets":[{"name":"github-docker-login"}]}'
