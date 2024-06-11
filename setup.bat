@echo off

echo "k8s cluster provisioning"
cd ./vm
vagrant halt
vagrant up

echo "glusterfs cluster provisioning"
cd ../glusterfs
vagrant up

cd ../vm
vagrant ssh m-k8s