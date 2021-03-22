#!/bin/bash

MEMA_NAME=memaslap-dd45d7998-76kxk
MEMC1_NAME=memcached-7bb58df7f7-gx97p
MEMC2_NAME=memcached-7bb58df7f7-hlgcz

kubectl exec $MEMA_NAME -- bash -c 'vnstat -i eth0 -tr 60' | dd status=none of=./results/veth_mema.txt conv=notrunc oflag=append &
kubectl exec $MEMC1_NAME -- bash -c 'vnstat -i eth0 -tr 60' | dd status=none of=./results/veth_memc1.txt conv=notrunc oflag=append &
kubectl exec $MEMC2_NAME -- bash -c 'vnstat -i eth0 -tr 60' | dd status=none of=./results/veth_memc2.txt conv=notrunc oflag=append &

sleep 60s

echo "[DONE] Sampling vNETWORK"
