#!/bin/bash

# Array of bucket names - defining 5 buckets
buckets=(
    "development-bucket-automation-bucket",
    "development-bucket-automation-bucket-123",
    "development-bucket-automation-bucket-678"
)
region="us-east-1"

# Function to create S3 buckets
create_buckets() {
    echo "Starting bucket creation process..."
    for bucket in "${buckets[@]}"; do
        aws s3 mb "s3://${bucket}" --region $region
        if [ $? -eq 0 ]; then
            echo "Successfully created bucket: ${bucket}"
        else
            echo "Failed to create bucket: ${bucket}"
        fi
    done
    echo "Bucket creation process completed."
}

# Function to list all buckets
list_buckets() {
    echo "Listing all S3 buckets:"
    aws s3 ls
    echo "Detailed bucket information:"
    for bucket in "${buckets[@]}"; do
        echo "Contents of bucket: ${bucket}"
        aws s3 ls "s3://${bucket}" --recursive --human-readable --summarize
        echo "----------------------------------------"
    done
}

# Main execution
create_buckets
list_buckets
