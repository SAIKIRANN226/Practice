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

dnf module disable nodejs -y &>> $LOGFILE

VALIDATE $? "Disabling old nodejs"

dnf module enable nodejs:18 -y &>> $LOGFILE

VALIDATE $? "Enabling nodejs 18"

dnf install nodejs -y &>> $LOGFILE

VALIDATE $? "Installing nodejs"

id roboshop
if [ $? -ne 0 ]
then 
    useradd roboshop &>> $LOGFILE
else    
    echo -e "$Y Roboshop user is already exists so skipping $N"
fi 

mkdir -p /app &>> $LOGFILE

VALIDATE $? "Creating app folder"

cd /app &>> $LOGFILE

VALIDATE $? "Moving to app folder"

curl -L -o /tmp/cart.zip https://roboshop-builds.s3.amazonaws.com/cart.zip &>> $LOGFILE

VALIDATE $? "Downloading the code"

unzip -o /tmp/cart.zip &>> $LOGFILE

VALIDATE $? "Unzipping the code"

npm install &>> $LOGFILE

VALIDATE $? "Installing dependencies"

cp /home/centos/Practice/cart.service /etc/systemd/system/cart.service &>> $LOGFILE

VALIDATE $? "Copied cart.service file"

systemctl daemon-reload &>> $LOGFILE

VALIDATE $? "Daemon reloaded"

systemctl enable cart &>> $LOGFILE

VALIDATE $? "Eable cart"

systemctl start cart &>> $LOGFILE

VALIDATE $? "Starting cart"