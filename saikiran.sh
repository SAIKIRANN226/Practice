#!/bin/bash 

DATE=$(date)

echo "Todays date is $DATE"

result=$(ls -la)

echo "Files including hidden $result" > /tmp/saikiran.output

saikiran=$(ls -ltr)

echo "files timing wise $saikiran" > /tmp/sai.output

status=$?

echo "the status of the above command is $status"



