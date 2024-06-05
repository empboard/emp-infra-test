#!/usr/bin/env bash

# Install Packages
yum install epel-release -y   # Extra Packages for Enterprise Linux
yum install vim-enhanced -y
yum install git -y

# install docker 
yum install docker-ce-18.06.0.ce-3.el7 docker-ce-cli-18.06.0.ce-3.el7 \
    containerd.io-1.2.6-3.3.el7 -y
systemctl enable --now docker

yum install kubectl-$1 kubelet-$1 kubeadm-$1 -y
systemctl enable --now kubelet