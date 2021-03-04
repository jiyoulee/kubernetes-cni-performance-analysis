#!/bin/bash

MEMC1_ID=564489e568b2
MEMC2_ID=fb46ffcef4e3

for (( i=1; i<=60; i++));
do
	docker stats --no-stream --format "{{.CPUPerc}}" $MEMC1_ID >> ./results/vcpu_memc1.txt &
	docker stats --no-stream --format "{{.CPUPerc}}" $MEMC2_ID >> ./results/vcpu_memc2.txt &
	sleep 1s;
done

echo "Sampling vCPU done..."
