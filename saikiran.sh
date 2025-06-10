#!/bin/bash

Y="\e[33m"

LOG_DIR="/home/centos/log_folder/"

find "$LOG_DIR" -type f -name "*.log" -mtime +14 -exec rm -f {} \;

echo -e "$Y Old .log files older than 14 days have been deleted from $LOG_DIR. $N"