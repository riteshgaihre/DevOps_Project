#!/bin/bash
#Author - Ritesh
#Date - Mon 31 Mar 2025
#Script - This script tracks the usage of aws resource

echo "list the ec2 instances"
aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId'
echo "list s3 buckets"
aws s3 ls

echo "list iam users"
aws iam list-users

echo "list aws lambda function"
aws lambda list-functions

# We can use cronjob to execute a script in a given certain time 
# Type command crontab -e to open crontab editor

# Add the following line 
#34 16 * * * /home/ubuntu/DevOps/aws_resource_tracker.sh >> /home/ubuntu/DevOps/log.txt

#This will generate output in log.txt everyday at 4:34 pm.
#If there is no log.txt file, it will autoatically added log.txt
