#!/usr/bin/env bash

# Install Packages
yum install epel-release -y   # Extra Packages for Enterprise Linux
yum install vim-enhanced -y
yum install git -y
yum install docker -y && systemctl enable --now docker
yum install kubectl-$1 kubelet-$1 kubeadm-$1 -y
systemctl enable --now kubelet

