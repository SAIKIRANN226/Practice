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
        echo -e "$2......$R FAILED $N"
        exit 1
    else
        echo -e "$2......$G SUCCESS $N"
    fi 
}


yum install git -y
VALIDATE $? "Installing git"