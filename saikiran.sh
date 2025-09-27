#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

File="/etc/passwd"

while IFS= read -r line 
do 
    echo -e "$Y $line $N"
done <<< $File