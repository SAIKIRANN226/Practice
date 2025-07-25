#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Number=$1

if [ $Number -gt 100 ]
then 
    echo -e "$Y Given number is greater than 100 $N"
    exit 1
else
    echo "$R Given number is lessthan 100 $N"
fi 