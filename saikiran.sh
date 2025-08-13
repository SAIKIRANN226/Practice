#!/bin/bash 

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
DISK_THRESHOLD=1
Message=""

while IFS= read -r line 
do 
    usage=$(echo $line | awk '{print 6F}')
    partition=$(echo $line | awk '{print 1F}')
    if [ $usage -ge $DISK_THRESHOLD ]
    then 
        message+="High disk usage on $partition: $usage <br>"
    fi 

    echo "Message:: $message"
done <<< $DISK_USAGE