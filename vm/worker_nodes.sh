#!/usr/bin/env bash

# Worker Node 설정
kubeadm join --token 123456.1234567890123456 \
--discovery-token-unsafe-skip-ca-verification 192.168.1.10:6443