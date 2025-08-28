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
    echo -e "$2 ... $R FAILED $N"
    exit 1
  else 
    echo -e "$2 ... $G SUCCESS $N"
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
  yum list installed $package -y &>> $LOGFILE
  if [ $? -ne 0 ]
  then 
    yum install $package -y &>> $LOGFILE
    VALIDATE $? "Installing $package"
  else
    echo -e "$Y $package is already installed so skipping $N"
  fi 
done