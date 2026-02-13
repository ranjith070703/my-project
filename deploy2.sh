#!/bin/bash
echo "🚀 Starting automatic deployment..."
minikube start --driver=docker --force
eval $(minikube docker-env)
docker build -t my-backend:latest ./backend
docker build -t my-frontend:latest ./frontend
kubectl apply -f fullstack-deployment.yaml
echo "🚀Running pods view"
kubectl get pods
echo "✅pods are viewed successfully!!"
echo "Services running!!"
kubectl get svc
echo "🚀Services viewed successfully!!.."
echo "✅ Deployment successfully completed!"



