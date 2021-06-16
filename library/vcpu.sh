#!/bin/bash

DIR=$2
NODE_CNT=$1

echo "[SAMPle] VCPU"

for (( i=1; i<=60; i++));
do
	for (( j=1; j<=$NODE_CNT; j++));
	do
		docker stats --no-stream --format "{{.CPUPerc}}" m$j >> $DIR/vcpu$j.txt &
	done;
	sleep 1s;
done

echo "[DONE] VCPU"
