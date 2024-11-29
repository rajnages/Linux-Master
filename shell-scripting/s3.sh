#!/bin/bash

# Set threshold for old files (in days)
DAYS_OLD=30
# Set size threshold (in MB)
SIZE_THRESHOLD=100

echo "Starting S3 bucket analysis..."

# List all buckets and process each one
aws s3 ls | awk '{print $3}' | while read bucket; do
    echo "Analyzing bucket: $bucket"

    # Check bucket size
    bucket_size=$(aws s3api list-objects --bucket "$bucket" --output json --query "[sum(Contents[].Size)]" | awk '{print $1/1024/1024}')

    # Find old objects
    aws s3api list-objects --bucket "$bucket" --query "Contents[?LastModified<='$(date -d "-$DAYS_OLD days" --iso-8601=seconds)']" --output text | while read -r line; do
        if [ ! -z "$line" ]; then
            echo "Old object found: $line"
        fi
    done

    echo "Bucket $bucket size: ${bucket_size}MB"
done
