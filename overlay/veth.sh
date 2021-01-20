#!/bin/bash

NODE_CNT=$1

for (( i=1; i<=$NODE_CNT; i++ ));
do
	docker exec -i m$i bash -c 'vnstat -i eth0 -tr 60' | dd status=none of=./results/veth$i.txt conv=notrunc oflag=append &
done

# args=("$@")

# for (( i=0; i<$#; i++ ))
# do
# 	vnstat -i ${args[$i]} -tr 60 > ./results/${args[$i]}.txt &
# done

sleep 60s

echo "Sampling vNETWORK done..."
