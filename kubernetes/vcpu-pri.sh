#!/bin/bash

MEMA_ID=45afa5dd7efb

for (( i=1; i<=60; i++));
do
	docker stats --no-stream --format "{{.CPUPerc}}" $MEMA_ID >> ./results/vcpu_mema.txt &
	sleep 1s;
done

echo "Sampling vCPU done..."
