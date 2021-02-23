#!/bin/bash

kubectl apply -f memaslap.yaml
kubectl apply -f memcached.yaml

sleep 5

kubectl get pods
