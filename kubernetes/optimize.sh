#!/bin/bash

DEV=ens11f1

../8875474/set_irq_affinity.sh $DEV
echo 32768 > /proc/sys/net/core/rps_sock_flow_entries
for i in $(seq 0 9)
do
 echo 3276 > /sys/class/net/$DEV/queues/rx-$i/rps_flow_cnt
done
