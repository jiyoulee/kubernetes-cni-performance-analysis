#!/bin/bash

NUM_NODES=2
FILE_PATH=./results/stats.txt
VETH_LIST=()

IPADDRESS1=172.34.0.2
IPADDRESS2=172.34.0.3
IPADDRESS3=172.34.0.4
IPADDRESS4=172.34.0.5
PORT=11211
THREADS=16
CONCURRENCY=512

for container in $(docker ps --format '{{.Names}}'); do
    iflink=`docker exec -it $container bash -c 'cat /sys/class/net/eth0/iflink'`
    iflink=`echo $iflink|tr -d '\r'`
    veth=`grep -l $iflink /sys/class/net/veth*/ifindex`
    veth=`echo $veth|sed -e 's;^.*net/\(.*\)/ifindex$;\1;'`
    VETH_LIST+=($veth)
    echo $container:$veth | dd status=none of=$FILE_PATH conv=notrunc oflag=append
done
echo "" | dd status=none of=$FILE_PATH conv=notrunc oflag=append

echo "*** Main shell start ***"

echo "Launching BENCHMARK..."
./benchmark-intra.sh &

echo "Sampling Container CPU..."
./sample-vcpu.sh $NUM_NODES &

echo "Sampling Container NETWORK..."
for i in ${VETH_LIST[@]}
do 
    ./sample-veth.sh $i &
done

echo "Sampling Host CPU..."
./sample-cpu.sh &

echo "*** Main shell done ***"
