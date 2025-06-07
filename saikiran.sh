#!/bin/bash 

DATE=$(date)

echo "Todays date is $DATE"

result=$(ls -la)

echo "Files including hidden $result" > /tmp/saikiran.output


status=$?

echo "the status of the above command is $status"


saikiran=$(ls -ltr)
