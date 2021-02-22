#!/bin/bash

NODE_CNT=1
FILE=./results/vethlist.txt
VETH_LIST=()

cd ./results/
rm $(ls)
cd ./../

# for container in $(docker ps --format '{{.Names}}'); do
#     iflink=`docker exec -it $container bash -c 'cat /sys/class/net/eth0/iflink'`
#     iflink=`echo $iflink|tr -d '\r'`
#     veth=`grep -l $iflink /sys/class/net/veth*/ifindex`
#     veth=`echo $veth|sed -e 's;^.*net/\(.*\)/ifindex$;\1;'`
#     VETH_LIST+=($veth)
#     echo $container:$veth | dd status=none of=$FILE conv=notrunc oflag=append
# done
# echo "" | dd status=none of=$FILE conv=notrunc oflag=append

echo "Start BENCHMARK..."
./inter-benchmark.sh &

sleep 1s

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