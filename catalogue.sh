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

curl -o /tmp/catalogue.zip https://roboshop-builds.s3.amazonaws.com/catalogue.zip &>> $LOGFILE

VALIDATE $? "Downloading catalogue code in app directory"

cd /app &>> $LOGFILE

VALIDATE $? "Moving to app folder"

unzip -o /tmp/catalogue.zip &>> $LOGFILE

VALIDATE $? "Unzipping the catalogue code"

npm install &>> $LOGFILE

VALIDATE $? "Downloading dependencies"

cp /home/centos/Practice/catalogue.service /etc/systemd/system/catalogue.service &>> $LOGFILE

VALIDATE $? "Copied catalogie.service file to system"

systemctl daemon-reload &>> $LOGFILE

VALIDATE $? "Daemon reloaded successfully"

systemctl enable catalogue &>> $LOGFILE

VALIDATE $? "Enabling catalogue"

cp /home/centos/mongodb.repo /etc/yum.repos.d/mongo.repo &>> $LOGFILE

VALIDATE $? "Copied mongodb.repo file"

dnf install mongodb-org-shell -y &>> $LOGFILE

VALIDATE $? "Installing mongodb-org-shell"

mongo --host 172.31.84.160 </app/schema/catalogue.js &>> $LOGFILE

VALIDATE $? "Loading schema"

systemctl start catalogue &>> $LOGFILE

VALIDATE $? "Starting catalogue"


