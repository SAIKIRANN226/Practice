#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

DATE=$(date)

echo "Script name is $0 and started at $DATE"

if [ $ID -ne 0 ]
then 
    echo -e "$R ERROR:: Please run the script with root user $N"
    exit 123
else
    echo -e "$Y Script started executing at $DATE $N"
fi 


yum install mysql -y 

if [ $? -ne 0 ]
then 
    echo -e "$R Installing  mysql is failed $N"
    exit 232
else
    echo -e "$G Installing mysql is success $N"
fi 