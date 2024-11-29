#!/bin/bash

# Define the path to check
path="/home/ubuntu/automation"

# Check if the file or directory exists
if [ -e "$path" ]; then
    echo "The file or directory '$path' exists."
else
    echo "The file or directory '$path' does not exist. Creating it..."

    # Check if it's a directory or file based on the path
    if [[ "$path" == */ ]]; then
        # Create directory if the path ends with a slash
        echo "Creating directory '$path'..."
        mkdir -p "$path"
    else
        # Create file if it's not a directory path
        echo "Creating file '$path'..."
        touch "$path"
    fi
fi
