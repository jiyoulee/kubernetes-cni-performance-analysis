#!/bin/bash

NUM_NODES=$1

for (( i=0; i<60; i++));
do
	for (( j=0; j<$NUM_NODES; j++));
	do
		docker stats --no-stream --format "{{.CPUPerc}}" m$j >> ./results/$j.txt &
	done;
	sleep 1s;
done

echo "Sampling Container CPU done..."
