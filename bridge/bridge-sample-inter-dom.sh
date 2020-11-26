#!/bin/bash

NUM_NODES=2
FILE_PATH=./results/stats.txt
VETH_LIST=()

IPADDRESS1=172.32.0.2
IPADDRESS2=172.32.0.3
IPADDRESS3=172.34.0.2
IPADDRESS4=172.34.0.3
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
../../../memcached_bench/libmemcached-1.0.15/clients/memaslap -s ${IPADDRESS1}:${PORT},${IPADDRESS2}:${PORT},${IPADDRESS3}:${PORT},$IPADDRESS4:${PORT} -c ${CONCURRENCY} -B -T ${THREADS} -t 60s | dd status=none of=$FILE_PATH conv=notrunc oflag=append &

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
