#!/bin/bash

#uninstall calico
kubectl delete -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl delete -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
ip route flush proto bird
ip link list | grep cali | awk '{print $2}' | cut -c 1-15 | xargs -I {} ip link delete {}
modprobe -r ipip
rm /etc/cni/net.d/10-calico.conflist && rm /etc/cni/net.d/calico-kubeconfig
systemctl restart kubelet

# kubeadm init & setting flannel
sudo sysctl -w net.bridge.bridge-nf-call-iptables=1
sudo sysctl -w net.ipv4.ip_forward=1
echo "y" | kubeadm reset
rm $HOME/.kube/config
cmd=`kubeadm init --pod-network-cidr=10.244.0.0/16 | grep -A 2 "kubeadm join"`
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
sshpass -p 1 ssh -t server3@163.152.20.140 -o StrictHostKeyChecking=no "echo 1 | sudo -S su && echo "y" | sudo kubeadm reset && sudo $cmd && sudo rm $HOME/.kube/config"
