#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "Fetching the list of s3 buckets..."

aws sts get-caller-identity >/dev/null 2>&1
if [ $? -ne 0 ]
then 
    echo -e "$R AWS_CLI is not configured properly. Run aws configure first $N"
    exit 1
fi 

aws s3 ls 

echo "Done"