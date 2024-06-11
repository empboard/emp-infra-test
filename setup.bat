@echo off

echo [setup.bat] k8s cluster provisioning
cd ./vm
vagrant halt
vagrant up

echo [setup.bat] glusterfs cluster provisioning
cd ../glusterfs
vagrant up

cd ../vm
vagrant ssh m-k8s