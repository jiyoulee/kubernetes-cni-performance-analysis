#!/bin/bash

MEMC1_ID=b7e8cf2e91d4
MEMC2_ID=a65dd57606b0

for (( i=1; i<=60; i++));
do
	docker stats --no-stream --format "{{.CPUPerc}}" $MEMC1_ID >> ./results/vcpu_memc1.txt &
	docker stats --no-stream --format "{{.CPUPerc}}" $MEMC2_ID >> ./results/vcpu_memc2.txt &
	sleep 1s;
done

echo "[DONE] Sampling vCPU"
