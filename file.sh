#!/bin/bash

directory="/var/log/"
size_limit="100M"

# Find and display files larger than the size limit
echo "Files larger than $size_limit in $directory:"
find $directory -type f -size +$size_limit -exec ls -lh {} \;

# du -sh /var/log/* | awk '$1 ~ /[0-9]+M|[0-9]+G/'
