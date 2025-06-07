#!/bin/bash 

DATE=$(date)

echo "Todays date is $DATE"

result=$(la -la)

echo "Files including hidden $result" > /tmp/saikiran.output