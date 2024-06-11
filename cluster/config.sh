#!/usr/bin/env bash

# vi alias
echo 'alias vi=vim' >> /etc/profile

# swap off 
swapoff -a
sed -i.bak -r 's/(.+ swap .+)/ #\1/' /etc/fstab

# kubernetes repository 추가 
gg_pkg="http://mirrors.aliyun.com/kubernetes/yum"
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=${gg_pkg}/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=${gg_pkg}/doc/yum-key.gpg ${gg_pkg}/doc/rpm-package-key.gpg
EOF

# SELinux 설정 (Permissive Mode)
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

# br_netfilter 커널 모듈 -> Bridge로 네트워크 구성, iptable 활성화
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

modprobe br_netfilter

# Local DNS (이름으로 노드 간 통신)
echo "192.168.1.10 m-k8s" >> /etc/hosts
for (( i=1; i<=$1; i++ )); do echo "192.168.1.10$i w$i-k8s" >> /etc/hosts; done

# 외부와 통신하기 위한 dns 서버 설정
cat <<EOF > /etc/resolv.conf
nameserver 1.1.1.1     # Cloudflare DNS
nameserver 8.8.8.8     # Google DNS
EOF

# docker repo
yum install yum-utils -y
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo