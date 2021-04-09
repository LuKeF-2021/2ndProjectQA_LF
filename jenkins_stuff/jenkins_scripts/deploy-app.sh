#! /bin/bash


cd ./kubernetes
kubectl apply -f namespace.yaml
cd nginx_stuff
kubectl apply -f nginx-configmap.yaml nginxlb.yaml nginx.yaml
cd .. && cd backend_stuff
kubectl apply -f backend.yaml backend-deployment.yaml
cd .. && cd frontend_stuff
kubectl apply -f frontend.yaml frontend-deployment.yaml


kubectl rollout restart deployment frontendApp
kubectl rollout restart deployment backendApp

kubectl get services lb_nginx