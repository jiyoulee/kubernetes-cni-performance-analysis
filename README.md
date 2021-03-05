This project experiments with evaluating the performance and resource consumption rate of the various container network interface plug-ins (CNI plug-ins) provided by Docker and Kubernetes in an inter-host environment, using Memcached, a network-intensive key-value store, as the primary workload.

## Development Environment
* Ubuntu 18.04
* Vim

## Kubernetes CNI Plug-ins

### Setting up the Environment
A Kubernetes cluster composed of one master node and one worker node w/ the container network plug-in of your choice installed will serve as the experiment environment. As a guide, a Kubernetes cluster with Flannel installed can be created by following the instructions at https://hiseon.me/linux/ubuntu/ubuntu-kubernetes-install/.

Once the cluster is created,

1. Clone this project onto **both** the master node and the worker node.
3. Execute the below commands inside the folder 'cni/kubernetes' **on the master node** to have Memaslap, the Memcached benchmark, running on the master node, and two Memcached servers running on the worker node.

> $ sudo ./../hyperthreading.sh  
> $ sudo ./optimize.sh  
> $ kubectl taint nodes --all node-role.kubernetes.io/master-  
> $ kubectl label nodes [master node name] server=4  
> $ kubectl label nodes [worker node name] server=3  
> $ kubectl apply -f memaslap.yaml  
> $ kubectl apply -f memcached.yaml  

### Evaluating Plug-ins
The experiment takes place for 70 seconds. Specifically, the Memaslap benchmark runs for 70 seconds while sampling scripts (scripts for sampling virtual CPU core usage statistics, network bandwith and physical CPU core usage rate) run for 60 seconds. All files to be modified below are located under the folder 'cni/kubernetes'

On the master node,

1. Modify the file 'inter-benchmark.sh' by setting the IP addresses of the two Memcached server pods (can be found by executing '$ kubectl describe pods') as the arguments for the flag '-s', and changing the pod name to that of the the Memaslap pod (can be found by executing '$ kubectl get pods'). The command itself must be explicitly modified (i.e. modifying the script variables MEMC1_ID, MEMC2_ID will not work).
2. Modify the file 'veth.sh' by setting the script variables 'MEMA_NAME', 'MEMC1_NAME' and 'MEMC2_NAME' as the Memaslap pod name and the two Memcached server pod names (can be found by executing '$ kubectl get pods'), respectively.
3. Modify the file 'vcpu-pri.sh' by setting the script variable 'MEMA_ID' as the Memaslap container ID (can be found by executing '$ docker ps').

On the worker node,

4. Modify the file 'vcpu-sec.sh' by setting the script variables 'MEMC1_ID' and 'MEMC2_ID' as the Memcached server container IDs (can be found by executing '$ docker ps').

Then,

5. Create the folder 'cni/kubernetes/results' on **both** the master node and the worker node. *This step is very important* because all scripts will be deleted should the experiment be conducted otherwise.  
6. Execute '$ ./inter-pri.sh' on the master node, and '$ ./inter-sec.sh' on the worker node, simultaneously.

### Understanding Experiment Results
After the experiment is complete, results are created under the previously made folder 'results' on each node.

Inside the master node's folder,

1. benchmark.txt: Memcached performance statistics  
2. pcpu.txt: physical CPU core usage statistics of the master node  
3. vcpu_mema.txt: virtual CPU core usage rate of the Memaslap container  
4. veth_mema.txt: network bandwith of the Memamslap container  
5. veth_memc1.txt: network bandwith of the first Memcached container  
6. veth_memc2.txt: network bandwith of the second Memcached conatainer  

Inside the worker node's folder,

1. pcpu.txt: physical CPU core usage statistics of the worker node
2. vcpu_memc1.txt: virtual CPU core usage rate of the first Memcached container
3. vcpu_memc2.txt: virtual CPU core usage rate of the second Memcached container

### Troubleshooting

Execute the below commands should the following error pop up when using the Kubernetes command-line tool 'kubectl': Unable to connect to the server: x509: certificate signed by unknown authority (possibly because of "crypto/rsa: verification error" while trying to verify candidate authority certificate "kubernetes").

> $ sudo cp -i /etc/kubernetes/admin.conf /home/[username]/.kube/config  
> $ export KUBECONFIG=/home/[username]/.kube/config
