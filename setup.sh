#!/bin/bash

# minikube setup, enable LB
minikube stop
minikube delete
minikube start --vm-driver=virtualbox
minikube addons enable metallb
kubectl apply -f srcs/yaml/metallb.yaml
eval $(minikube docker-env)

# build images
docker build -t nginx-image ./srcs/nginx
docker build -t mysql-image ./srcs/mysql
docker build -t wordpress-image ./srcs/wordpress
docker build -t phpmyadmin-image ./srcs/phpmyadmin

# apply configs
kubectl apply -f srcs/yaml/nginx.yaml
kubectl apply -f srcs/yaml/mysql.yaml
kubectl apply -f srcs/yaml/wordpress.yaml
kubectl apply -f srcs/yaml/phpmyadmin.yaml