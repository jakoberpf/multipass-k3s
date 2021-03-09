#!/bin/bash

for i in $(seq 1 $1); 
do 
    multipass delete worker$i
done