#!/bin/bash 

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

source_dir="/tmp/saikiran-logs"

if [ ! -d $source_dir ]
then 
    echo -e "$R Source directory $source_dir does not exists $N"
    exit 1
fi 

files_to_delete=$(find $source_dir -type f -mtime +7 -name "*.log")

while IFS= read -r line 
do 
    echo -e "$Y Deleting file:: $line"
    rm -rf $line
done <<< $files_to_delete