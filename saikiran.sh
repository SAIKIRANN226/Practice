#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


SOURCE_DIR="/tmp/my-logs"

if [ ! -d $SOURCE_DIR ]
then 
    echo -e "$R $SOURCE_DIR does not exist $N"
    exit 1
fi 


FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log" -delete)