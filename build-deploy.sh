#!/bin/bash

# Build and Deploy Customer Microservices

cd ~/dev/istio/istio-tutorial/customer-va/java/springboot
mvn clean package
docker build -t docker.io/rcuchoa/customer:va .
docker tag rcuchoa/customer:va 681008889057.dkr.ecr.sa-east-1.amazonaws.com/customer:va
docker push 681008889057.dkr.ecr.sa-east-1.amazonaws.com/customer:va
kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

cd ~/dev/istio/istio-tutorial/customer-vb/java/springboot
mvn clean package
docker build -t docker.io/rcuchoa/customer:vb .
docker tag rcuchoa/customer:vb 681008889057.dkr.ecr.sa-east-1.amazonaws.com/customer:vb
docker push 681008889057.dkr.ecr.sa-east-1.amazonaws.com/customer:vb
kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

# Build and Deploy Preference Microservice

cd ~/dev/istio/istio-tutorial/preference/java/springboot
mvn clean package
docker build -t docker.io/rcuchoa/preference:v1 .
docker tag rcuchoa/preference:v1 681008889057.dkr.ecr.sa-east-1.amazonaws.com/preference:v1
docker push 681008889057.dkr.ecr.sa-east-1.amazonaws.com/preference:v1
kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

# Build and Deploy Recommendation-1 Microservice

cd ~/dev/istio/istio-tutorial/recommendation-v1/java/springboot
mvn clean package
docker build -t docker.io/rcuchoa/recommendation:v1 .
docker tag rcuchoa/recommendation:v1 681008889057.dkr.ecr.sa-east-1.amazonaws.com/recommendation:v1
docker push 681008889057.dkr.ecr.sa-east-1.amazonaws.com/recommendation:v1
kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

# Build and Deploy Recommendation-2 Microservice

cd ~/dev/istio/istio-tutorial/recommendation-v2/java/springboot
mvn clean package
docker build -t docker.io/rcuchoa/recommendation:v2 .
docker tag rcuchoa/recommendation:v2 681008889057.dkr.ecr.sa-east-1.amazonaws.com/recommendation:v2
docker push 681008889057.dkr.ecr.sa-east-1.amazonaws.com/recommendation:v2
kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

# Build and Deploy Recommendation-3 Microservice

cd ~/dev/istio/istio-tutorial/recommendation-v3/java/springboot
mvn clean package
docker build -t docker.io/rcuchoa/recommendation:v3 .
docker tag rcuchoa/recommendation:v3 681008889057.dkr.ecr.sa-east-1.amazonaws.com/recommendation:v3
docker push 681008889057.dkr.ecr.sa-east-1.amazonaws.com/recommendation:v3
kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

# Deploy Microservices Kubernetes Services

cd ~/dev/istio/istio-tutorial/istio-services
kubectl apply -f customer-service.yml
kubectl apply -f preference-service.yml
kubectl apply -f recommendation-service.yml

clear

kubectl get all --show-labels