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

