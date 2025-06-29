#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR="/tmp/MSK-Logs"

if [ ! -d $SOURCE_DIR ]
then 
    echo -e "$R $SOURCE_DIR does not exits $N"
    exit 1
else
    echo -e "$Y Check wether your $SOURCE_DIR exists or not $N"
fi 


FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log" -delete)