### 환경

- Hypervisor: VirtualBox
- OS: CentOS 7
- CNI: Calico
- VM Provisioning: Vagrant
- Container Orchestration: k8s
- Container Runtime: Docker
- NFS: GlusterFS

```shell
> vagrant up                # 생성
> vagrant halt              # 정지
> vagrant destory           # 삭제
> vagrant ssh <node-name>   # ssh 접속
```

### 전체 Cluster 구성도

![cluster](https://github.com/empboard/emp-infra-test/assets/95991654/819c27ec-2838-4ae1-8ec9-96da355e2543)

### Batch File

setup.bat 클릭 한번으로 전체 Cluster 구축 가능

### Kubernetes Cluster 구성

```shell
> vagrant up          # /vm/Vagrantfile
> vagrant ssh m-k8s   # Master Node 접속
$ kubectl get nodes
```

** Connection 관련 Error 발생 시 Master Node의 config 파일에 다음을 설정 **

```shell
$ mkdir -p $HOME/.kube
$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
$ sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

### GlusterFS Cluster 구성

```shell
> vagrant up           # /glusterfs/Vagrantfile
```

### StorageClass 생성

```
> vagrant ssh m-k8s    # /vm/Vagrantfile (마스터 노드 접속)
$ kubectl apply -f /vagrant/sc/gfs-sc.yaml    # storageclass 생성
$ kubectl get sc
```
