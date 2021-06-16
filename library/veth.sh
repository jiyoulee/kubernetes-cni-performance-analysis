#!/bin/bash
#
# Description

DIR=$2
NODE_CNT=$1

echo "[SAMPLE] VETH"

for (( i=1; i<=$NODE_CNT; i++ ));
do
        docker exec -i m$i bash -c 'vnstat -i eth0 -tr 60' | dd status=none of=$DIR/veth$i.txt conv=notrunc oflag=append &
done

sleep 60s

echo "[DONE] VETH"
