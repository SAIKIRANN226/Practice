#!/bin/bash

number=$1

if [ $number -gt 100 ]
then 
    echo "Given number is greaterthan 100"
    exit 1
else 
    echo "Given number is lessthan 100"
fi 