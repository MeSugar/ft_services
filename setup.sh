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
docker build -t ftps-image ./srcs/ftps
docker build -t influxdb-image ./srcs/influxdb
docker build -t grafana-image ./srcs/grafana

# apply configs
kubectl apply -f srcs/yaml/nginx.yaml
kubectl apply -f srcs/yaml/mysql.yaml
kubectl apply -f srcs/yaml/wordpress.yaml
kubectl apply -f srcs/yaml/phpmyadmin.yaml
kubectl apply -f srcs/yaml/ftps.yaml
kubectl apply -f srcs/yaml/influxdb.yaml
kubectl apply -f srcs/yaml/grafana.yaml