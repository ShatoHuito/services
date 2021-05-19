#!/bin/sh
minikube stop
minikube delete
echo "minikube start"
minikube start --vm-driver=virtualbox --memory='4096' --addons metallb
eval $(minikube docker-env)

docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2
minikube addons enable metallb

#metallb
kubectl apply -f ./srcs/configmap.yaml

docker build -t nginx_image ./srcs/nginx/
docker build -t php_image ./srcs/phpmyadmin/
docker build -t mysql_image ./srcs/mysql/
docker build -t wordpress_image ./srcs/wordpress/
docker build -t ftps_image ./srcs/ftps/
docker build -t influx_image ./srcs/influxdb/
docker build -t grafana_image ./srcs/grafana/




kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml
kubectl apply -f ./srcs/influxdb/influxdb.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml
