#!/bin/bash

AMI="ami-0b4f379183e5706b9"
SG="sg-062184d660bab16ba"
INSTANCES=("mongodb", "shipping", "web", "payment")
ZONE_ID="Z03123921NOU39UU26DXY"

for i in "${INSTANCES[@]}"
do 
    if [ $i == "mongodb"] || [ $i == "shipping"]
    then 
        INSTANCE_TYPE="t3.small"
    else
        INSTANCE_TYPE="t2.micro"
    fi 
    IP_ADDRESS=$(aws ec2 run-instances --image-id $AMI --instance-type $INSTANCE_TYPE --security-group-ids $SG --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PublicIpAddress' --output text)
    echo "PublicIP of the $i: $IP_ADDRESS"
done 