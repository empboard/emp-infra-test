## 환경

- Hypervisor: VirtualBox
- OS: CentOS 7
- CNI: Calico
- VM Provisioning: Vagrant
- Container Orchestration: k8s 1.18.4
- Container Runtime: Docker

```shell
vagrant up        # 생성
vagrant halt      # 정지
vagrant destory   # 삭제
```

## Node 접속

```shell
vagrant ssh {node-name}
```

## Kubernetes Cluster 구성 확인

```shell
kubectl get nodes
```
