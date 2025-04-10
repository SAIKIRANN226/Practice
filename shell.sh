#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

DATE=$(date)

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo -e "$2....$R FAILED $N"
        exit 1
    else
        echo -e "$2....$G SUCCESS $N"
    fi 
}

if [ $ID -ne 0 ]
then 
    echo -e "$R ERROR:: Please run the script with root user $N"
    exit 1
else
    echo -e "$Y Script started executing at $DATE $N"
fi 


for package in $@
do
    yum list installed $package
    if [ $? -ne 0 ]
    then 
        yum install $package -y &>> /tmp/saikiran.logs
        VALIDATE $? "Installation of $package"
    else
        echo -e "$package is already installed so $Y.....SKIPPING $N"
    fi 
done