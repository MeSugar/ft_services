#!/bin/bash

# minikube setup, enable and metallb

minikube start --vm-driver=virtualbox
minikube addons enable metallb
kubectl apply -f srcs/yaml/metallb.yaml
eval $(minikube docker-env)

# build images
./srcs/nginx/start.sh