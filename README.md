### 환경

- Hypervisor: VirtualBox
- OS: CentOS 7
- CNI: Calico
- VM Provisioning: Vagrant
- Container Orchestration: k8s
- Container Runtime: Docker
- NFS: GlusterFS

---

### 전체 Cluster 구성도

## ![cluster](https://github.com/empboard/emp-infra-test/assets/95991654/819c27ec-2838-4ae1-8ec9-96da355e2543)

### Cluster 구축

**Windows 환경 (자동 구축 스크립트 실행)**

```shell
> ./setup.bat
```

**수동 구축**

```shell
> vagrant up    # /vm
> vagrant up    # /glusterfs
```

---

### Cluster 접속 및 StorageClass 생성

```shell
> vagrant ssh <node-name>
$ kubectl apply -f /vagrant/sc/gfs-sc.yaml
$ kubectl get sc
```

---

### Connection Error 발생 시

Master Node에 다음 커맨드 입력

```shell
$ mkdir -p $HOME/.kube
$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
$ sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
