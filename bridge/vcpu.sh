#!/bin/bash

NODE_CNT=$1

for (( i=1; i<=60; i++));
do
	for (( j=1; j<=$NODE_CNT; j++));
	do
		docker stats --no-stream --format "{{.CPUPerc}}" m$j >> ./results/vcpu$j.txt &
	done;
	sleep 1s;
done

echo "[DONE] Sampling vCPU"
