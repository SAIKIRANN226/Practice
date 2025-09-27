#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e "$Y Fetching the list of s3 buckets...$N"

aws sts get-caller-identity 

if [ $? -ne 0 ]
then 
    echo -e "$R AWS_CLI is not configured properly. Configure aws first $N"
    exit 1
fi 

aws s3 ls 

echo -e "$G Done $N"