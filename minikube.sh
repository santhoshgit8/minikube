#!/bin/bash
set -eux

### Update system
sudo dnf update -y

### Install Docker
sudo dnf install -y docker
sudo systemctl enable docker
sudo systemctl start docker

### Add ec2-user to docker group
sudo usermod -aG docker ec2-user

### Install kubectl
curl -LO https://dl.k8s.io/release/v1.35.0/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/kubectl

### Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube

### Apply docker group in current shell
newgrp docker <<EOF

echo "Docker access check"
docker ps

echo "Starting Minikube with docker driver"
minikube start --driver=docker

EOF

EOF
minikube status
minikube start
kubectl get nodes
kubectl get pods -A