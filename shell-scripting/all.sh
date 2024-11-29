#!/bin/bash

# Function to display script usage
show_usage() {
    echo "Usage: $0 [options] <filename>"
    echo "Options:"
    echo "  -h, --help     Show this help message"
    echo "  -n <name>      Specify a name"
    echo "  -c <count>     Specify a count number"
    exit 1
}

# Function to log messages
log_message() {
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] $1"
}

# Function to check if a number is even or odd
check_number() {
    if [ $((${1} % 2)) -eq 0 ]; then
        echo "$1 is even"
        return 0
    else
        echo "$1 is odd"
        return 1
    fi
}

# Function to demonstrate string operations
string_operations() {
    local str1="Hello"
    local str2="World"

    # String concatenation
    local combined="$str1 $str2"
    echo "Combined string: $combined"

    # String length
    echo "Length of combined string: ${#combined}"

    # String comparison
    if [ "$str1" == "Hello" ]; then
        echo "String matches"
    fi
}

# Function to demonstrate arrays
array_operations() {
    # Declare an array
    local fruits=("Apple" "Banana" "Orange" "Mango")

    # Print all elements
    echo "All fruits: ${fruits[@]}"

    # Print array length
    echo "Number of fruits: ${#fruits[@]}"

    # Loop through array
    for fruit in "${fruits[@]}"; do
        echo "Processing fruit: $fruit"
    done
}

# Function to demonstrate file operations
file_operations() {
    local filename=$1

    # Check if file exists
    if [ -f "$filename" ]; then
        echo "File exists"

        # Read file line by line
        while IFS= read -r line; do
            echo "Line: $line"
        done <"$filename"
    else
        echo "Creating new file"
        echo "Sample content" >"$filename"
    fi
}

# Main script starts here
log_message "Script started. Process ID: $$"

# Variables
NAME=""
COUNT=0
FILENAME=""

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
    -h | --help)
        show_usage
        ;;
    -n)
        NAME="$2"
        shift 2
        ;;
    -c)
        COUNT="$2"
        shift 2
        ;;
    *)
        FILENAME="$1"
        shift
        ;;
    esac
done

# Check required parameters
if [ -z "$FILENAME" ]; then
    echo "Error: Filename is required"
    show_usage
fi

# Demonstrate if/elif/else
if [ -n "$NAME" ]; then
    echo "Hello, $NAME!"
elif [ $COUNT -gt 0 ]; then
    echo "Count is greater than 0"
else
    echo "No name or count specified"
fi

# Demonstrate while loop
echo "Counting down from $COUNT"
while [ $COUNT -gt 0 ]; do
    echo $COUNT
    COUNT=$((COUNT - 1))
    sleep 1
done

# Demonstrate until loop
counter=1
until [ $counter -gt 5 ]; do
    echo "Until loop iteration: $counter"
    counter=$((counter + 1))
done

# Demonstrate for loop
echo "Demonstrating for loop:"
for i in {1..5}; do
    echo "Iteration $i"
done

# Call our functions
log_message "Starting string operations"
string_operations

log_message "Starting array operations"
array_operations

log_message "Starting file operations"
file_operations "$FILENAME"

# Demonstrate case statement
echo "Please enter a fruit name:"
read fruit
case "$fruit" in
"apple" | "Apple")
    echo "Selected fruit is an apple"
    ;;
"banana" | "Banana")
    echo "Selected fruit is a banana"
    ;;
*)
    echo "Unknown fruit"
    ;;
esac

# Error handling example
some_command_that_might_fail 2>/dev/null
if [ $? -ne 0 ]; then
    log_message "Error: Command failed"
fi

# Demonstrate special variables
echo "Script name: $0"
echo "Number of arguments passed: $#"
echo "All arguments: $@"
echo "Process ID: $$"
echo "Last command exit status: $?"

# Cleanup and exit
log_message "Script completed successfully"
exit 0
