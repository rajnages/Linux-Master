#!/bin/bash

#variables
name="JOhn"
echo "Hello $name"

#read the input
#!/bin/bash
echo "Enter your name:"
read name
echo "Hello, $name!"

#read multiple inputs
#!/bin/bash
echo "Enter your name and age:"
read name age
echo "Hello, $name! You are $age years old."
# bash -x script.sh this is for debugging purpose

#if else and elif example
#!/bin/bash
# echo "Enter a number:"
# read number
# if [ "$number" -eq 10 ]; then
#     echo "The number is 10"
# elif [ "$number" -lt 10 ]; then
#     echo "The number is less than 10"
# else
#     echo "The number is greater than 10"
# fi

# # for loop example
# array=(1 2 3 4 5)
# for i in ${array[@]}; do
#     echo "$i"
# done

# if loop
echo "Enter The Number"
read number
if [ "$number" -gt 10 ]; then
    # Commands if condition is true
    echo "This is greater than $number"
elif [ "$number" -lt 10 ]; then
    # Commands if the other condition is true
    echo "This is less than $number"
else
    # Commands if none of the conditions are true
    echo "This is equal to $number"
fi

# for loop
array=(1 2 3 4 5)
for num in ${array[@]}; do
    echo "Numbers is $num"
done

# while loop
#!/bin/bash
count=1
while [ $count -le 5 ]; do
    echo "Count: $count"
    ((count++))
done

# until loop
until [ condition ]; do
    # Commands to execute until the condition becomes true
done
