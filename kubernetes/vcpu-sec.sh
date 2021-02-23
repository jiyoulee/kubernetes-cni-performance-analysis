#!/bin/bash

MEMC1_ID=ee85577a7b7f
MEMC2_ID=2b4650d1b99d

for (( i=1; i<=60; i++));
do
	docker stats --no-stream --format "{{.CPUPerc}}" $MEMC1_ID >> ./results/vcpu_memc1.txt &
	docker stats --no-stream --format "{{.CPUPerc}}" $MEMC2_ID >> ./results/vcpu_memc2.txt &
	sleep 1s;
done

echo "Sampling vCPU done..."
