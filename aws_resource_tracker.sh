#!/bin/bash

#Author - Ritesh
#Date - Sat 19 Apr 2025
#Script - This script tracks the usage of AWS resources.

#set -x          #debug mode
set -e           #exit the script when there is an error
set -o pipefail  #fail the script if any part of pipeline fails.

echo "print the list of ec2 instances"
aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId'

echo "print the s3 buckets"
aws s3 ls

echo "print the lambda function"
aws lambda list-functions

echo "print IAM user"
aws iam list-users

#Cronjob to run this script at every day at 7:40 pm
#40 19 * * * /home/ubuntu/DevOps/aws_resource_tracker.sh >> /home/ubuntu/DevOps/log.txt 2>&1

#Note: If a log.txt doesnt exist, it will be automatically created

