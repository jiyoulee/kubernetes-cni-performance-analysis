#!/bin/bash

MEMA_NAME=memaslap-854f66c954-m48ls
MEMC1_NAME=memcached-bf5f768cb-27cjm
MEMC2_NAME=memcached-bf5f768cb-vl87g

kubectl exec $MEMA_NAME -- bash -c 'vnstat -i eth0 -tr 60' | dd status=none of=./results/veth_mema.txt conv=notrunc oflag=append &
kubectl exec $MEMC1_NAME -- bash -c 'vnstat -i eth0 -tr 60' | dd status=none of=./results/veth_memc1.txt conv=notrunc oflag=append &
kubectl exec $MEMC2_NAME -- bash -c 'vnstat -i eth0 -tr 60' | dd status=none of=./results/veth_memc2.txt conv=notrunc oflag=append &

sleep 60s

echo "Sampling vNETWORK done..."
