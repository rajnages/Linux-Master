#!/bin/bash

threshold=90
recipient="mail" # Set your email address here

# Get the disk usage percentage
disk_usage=$(df -h / | tail -n 1 | awk '{print $5}' | sed 's/%//')

# Check if the disk usage is greater than or equal to the threshold
if [ $disk_usage -ge $threshold ]; then
    message="Disk space is running low! Disk Usage: $disk_usage%"
    echo $message | mail -s "Disk Space Alert" $recipient
    echo $message # Optional: print the message to the terminal as well
else
    message="Disk space is within acceptable limits. Disk Usage: $disk_usage%"
    echo $message
fi
