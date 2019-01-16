#!/bin/bash

# Build and Deploy Customer Microservices

cd ~/dev/istio-tutorial/customer-va/java/springboot
mvn clean package
docker build -t example/customer:va .
kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

cd ~/dev/istio-tutorial/customer-vb/java/springboot
mvn clean package
docker build -t example/customer:vb .
kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

# Build and Deploy Preference Microservice

cd ~/dev/istio-tutorial/preference/java/springboot
mvn clean package
docker build -t example/preference:v1 .
kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

# Build and Deploy Recommendation-1 Microservice

cd ~/dev/istio-tutorial/recommendation-v1/java/springboot
mvn clean package
docker build -t example/recommendation:v1 .
kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

# Build and Deploy Recommendation-2 Microservice

cd ~/dev/istio-tutorial/recommendation-v2/java/springboot
mvn clean package
docker build -t example/recommendation:v2 .
kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

# Build and Deploy Recommendation-3 Microservice

cd ~/dev/istio-tutorial/recommendation-v3/java/springboot
mvn clean package
docker build -t example/recommendation:v3 .
kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

# Deploy Microservices Kubernetes Services

cd ~/dev/istio-tutorial/istio-services
kubectl apply -f customer-service.yml
kubectl apply -f preference-service.yml
kubectl apply -f recommendation-service.yml

clear

kubectl get all --show-labels