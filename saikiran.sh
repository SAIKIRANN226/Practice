#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR="/tmp/saikiran-logs"

if [ ! -d $SOURCE_DIR ]
then 
    echo -e "$R Source directory $SOURCE_DIR does not exits $N"
    exit 1
fi 


FILES_TO_DELETE=$(find $SOURCE_DIR -type d -mtime +7 -name "preethi")

while IFS= read -r line 
do 
    echo "Deleting file: $line"
    rm -rf $line 
done <<< $FILES_TO_DELETE