### 환경

- Hypervisor: VirtualBox
- OS: CentOS 7
- CNI: Calico
- VM Provisioning: Vagrant
- Container Orchestration: k8s
- Container Runtime: Docker
- NFS: GlusterFS

---

### 사전 세팅 

#### Windows x64 Hyper-V 활성화
- Win + r -> appwiz.cpl -> Windows 기능 켜기/끄기 -> Hyper-V 활성화 

#### Virtual Box 및 Vagrant 설치
- Virtual Box: https://www.virtualbox.org/
- Vagrant: https://www.vagrantup.com/

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

![스크린샷 2024-06-12 001319](https://github.com/empboard/emp-infra-test/assets/95991654/181af121-b61b-4766-bcf1-ed20de683633)

---

### Connection Error 발생 시

Master Node에 다음 커맨드 입력

```shell
$ mkdir -p $HOME/.kube
$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
$ sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
