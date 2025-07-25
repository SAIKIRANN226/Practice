#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

DATE=$(date)
LOGFILE="/tmp/$0.log"

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
    yum list installed $package &>> $LOGFILE # Check installed or not
    if [ $? -ne 0 ] # If not installed
    then
        yum install $package -y &>> $LOGFILE # Install the package
        VALIDATE $? "Installation of $package" # Validate
    else
        echo -e "$package is already installed ... $Y SKIPPING $N"
    fi
done
