#!/bin/bash

numL=${1:-3} 
numW=${2:-3}  

sh .deploy.leader.sh $numL
sh .deploy.worker.sh $numW

declare -a leaders
for i in $(seq 1 $numL); 
do 
    node_name=leader$i
    leaders+=($(multipass info $node_name | grep IPv4 | awk '{print $2}'))
done

declare -a workers
for i in $(seq 1 $numW); 
do 
    node_name=worker$i
    workers+=($(multipass info $node_name | grep IPv4 | awk '{print $2}'))
done

tee ../ansible/inventory << EOF
[leaders]
leader1 ansible_host=${leaders[0]}
leader2 ansible_host=${leaders[1]}
leader3 ansible_host=${leaders[2]}

[workers]
worker1 ansible_host=${workers[0]}
worker2 ansible_host=${workers[1]}
worker3 ansible_host=${workers[2]}
EOF
