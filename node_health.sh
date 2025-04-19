#!/bin/bash

#Author - Ritesh
#Date - Sat 19 Apr 2025
#Script - This script provides a node health of virtual machine.

#set -x           #debug mode
#set -e           #exit the script when there is an error
#set -o pipefail  #fail the script if any part of pipeline fails

echo "print the running processes then search string name amazon using grep and extract specific columns number 2 using awk"
ps -ef | grep amazon | awk -F " " '{print $2}'

echo "print the no. of CPU used"
nproc

echo "print the memory usage"
free

echo "print the disk size"
df -h 

