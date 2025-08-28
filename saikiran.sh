#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

yum install nginx -y 
if [ $? -ne 0 ]
then 
  echo -e "$R Installing nginx is failed $N"
  exit 1
else
  echo -e "$G Installing nginx is success $N"
fi