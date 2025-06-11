#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


SOURCE_DIR="/tmp/sam-logs"

if [ ! -d $SOURCE_DIR ]
then 
    echo -e "$R Source directory does not exists $N"
    exit 1
else
    echo -e "$Y Found source directory in tmp folder $N"
fi 


find $SOURCE_DIR -type f -mtime +14 -name "*log" -exec rm -f {} \;

echo -e "$G Successfully deleted old log files $N"

