## 환경

- Hypervisor: VirtualBox
- OS: CentOS 7
- CNI: Calico
- VM Provisioning: Vagrant
- Container Orchestration: k8s
- Container Runtime: Docker

```shell
vagrant up                # 생성
vagrant halt              # 정지
vagrant destory           # 삭제
vagrant ssh {node-name}   # ssh 접속
```

## Kubernetes Cluster 구성 확인

```shell
kubectl get nodes
```
