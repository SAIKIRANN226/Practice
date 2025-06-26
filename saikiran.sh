#/bin/bash

ID=$(date)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

DATE=$(date)
LOGFILE="/tmp/saikiran-logs"

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo -e "$2.....$R FAILED $N"
        exit 1
    else
        echo -e "$2.....$G SUCCESS $N"
    fi 
}

if [ $ID -ne 0 ]
then 
    echo -e "$R ERROR:: Please run the script with root user $N"
    exit 1
else
    echo -e "$Y Script started executing at $DATE $N"
fi 


for software in $@
do 
    yum list installed $software
    if [ $? -ne 0 ]
    then 
        yum install $software -y $>> $LOGFILE
        VALIDATE $? "Installing $software"
    else
        echo -e "$Y $software is already installed so....SKIPPING $N"
    fi
done