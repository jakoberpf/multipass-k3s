#!/bin/bash

for i in $(seq 1 $1); 
do 
    multipass delete leader$i
done