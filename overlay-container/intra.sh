#!/bin/bash

NODE_CNT=3
FILE=./results/vethlist.txt
VETH_LIST=()
VETH_SPECIAL=veth9236e5a

cd ./results/
rm $(ls)
cd ./../

# for container in $(docker ps --format '{{.Names}}'); do
#     iflink=`docker exec -it $container bash -c 'cat /sys/class/net/eth1/iflink'`
#     iflink=`echo $iflink|tr -d '\r'`
#     veth=`grep -l $iflink /sys/class/net/veth*/ifindex`
#     veth=`echo $veth|sed -e 's;^.*net/\(.*\)/ifindex$;\1;'`
#     VETH_LIST+=($veth)
#     echo $container:$veth | dd status=none of=$FILE conv=notrunc oflag=append
# done
# VETH_LIST+=($VETH_SPECIAL)
# echo "" | dd status=none of=$FILE conv=notrunc oflag=append

echo "Start BENCHMARK..."
./intra-benchmark.sh &

sleep 1

echo "Sampling vCPU data..."
./vcpu.sh $NODE_CNT &

echo "Sampling vNETWORK data..."
./veth.sh $NODE_CNT &
# for i in ${VETH_LIST[@]}
# do 
#     ./veth.sh $i &
# done

echo "Sampling pCPU data..."
./pcpu.sh &

