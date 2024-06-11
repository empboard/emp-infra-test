#!/usr/bin/env bash

# init kubernetes
kubeadm init --token 123456.1234567890123456 --token-ttl 0 \
--pod-network-cidr=172.16.0.0/16 --apiserver-advertise-address=172.20.1.10

# Master Node 설정 
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# 네트워크 설정 (CNI)
kubectl apply -f https://raw.githubusercontent.com/sysnet4admin/IaC/master/manifests/172.16_net_calico.yaml
