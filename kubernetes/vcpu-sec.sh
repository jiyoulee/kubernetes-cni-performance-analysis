#!/bin/bash

MEMC1_ID=2f17d5aa7321
MEMC2_ID=9a9ef80c6341

for (( i=1; i<=60; i++));
do
	docker stats --no-stream --format "{{.CPUPerc}}" $MEMC1_ID >> ./results/vcpu_memc1.txt &
	docker stats --no-stream --format "{{.CPUPerc}}" $MEMC2_ID >> ./results/vcpu_memc2.txt &
	sleep 1s;
done

echo "Sampling vCPU done..."
