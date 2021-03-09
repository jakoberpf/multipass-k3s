#!/bin/bash

sh .destroy.leader.sh 3
sh .destroy.worker.sh 3

multipass purge

rm /var/db/dhcpd_leases