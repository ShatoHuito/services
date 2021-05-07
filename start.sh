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
kubectl apply -f configmap.yaml

docker build -t nginx_image ./nginx/
docker build -t php_image ./phpmyadmin/
docker build -t mysql_image ./mysql/
docker build -t wordpress_image ./wordpress/


kubectl apply -f ./nginx/nginx.yaml
kubectl apply -f ./phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./mysql/mysql.yaml
kubectl apply -f ./wordpress/wordpress.yaml
