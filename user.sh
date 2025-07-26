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

curl -L -o /tmp/user.zip https://roboshop-builds.s3.amazonaws.com/user.zip &>> $LOGFILE

VALIDATE $? "Downloading user code"

unzip -o /tmp/user.zip &>> $LOGFILE

VALIDATE $? "Unzipping the code"

npm install &>> $LOGFILE

VALIDATE $? "Installing dependencies"

cp /home/centos/Practice/user.service /etc/systemd/system/user.service &>> $LOGFILE

VALIDATE $? "Copied user.service file"

systemctl daemon-reload &>> $LOGFILE

VALIDATE $? "Daemon reloaded"

systemctl enable user &>> $LOGFILE

VALIDATE $? "Enabling user"

cp /home/centos/Practice/mongodb.repo /etc/yum.repos.d/mongo.repo &>> $LOGFILE

VALIDATE $? "Copied mongodb.repo file"

dnf install mongodb-org-shell -y &>> $LOGFILE

VALIDATE $? "Installing  mongodb-or-shell"

mongo --host 172.31.84.160 </app/schema/user.js &>> $LOGFILE

VALIDATE $? "Loaded schema"

systemctl start user &>> $LOGFILE

VALIDATE $? "Started user"

