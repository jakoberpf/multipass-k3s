#!/bin/bash

for i in $(seq 1 $1); 
do 
    node_name=leader$i
    echo "Deploying $node_name"
    multipass launch --name $node_name --cpus 4 --mem 4g --disk 20g --cloud-init=./cloud-init.yaml
done