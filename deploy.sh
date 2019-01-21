#!/bin/bash

# Deploy Customer Microservices

cd ~/dev/istio/istio-tutorial/customer-va/java/springboot

kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

cd ~/dev/istio/istio-tutorial/customer-vb/java/springboot

kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

# Deploy Preference Microservice

cd ~/dev/istio/istio-tutorial/preference/java/springboot

kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

# Deploy Recommendation-1 Microservice

cd ~/dev/istio/istio-tutorial/recommendation-v1/java/springboot

kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

# Deploy Recommendation-2 Microservice

cd ~/dev/istio/istio-tutorial/recommendation-v2/java/springboot

kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

# Deploy Recommendation-3 Microservice

cd ~/dev/istio/istio-tutorial/recommendation-v3/java/springboot

kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment.yml)

# Deploy Microservices Kubernetes Services

cd ~/dev/istio/istio-tutorial/istio-services
kubectl apply -f customer-service.yml
kubectl apply -f preference-service.yml
kubectl apply -f recommendation-service.yml

clear

kubectl get all --show-labels