# variables
# data types
# if / elif / else
-Used for conditional statements. Executes different blocks of code based on the evaluation of conditions.

syntax:
if [ "$value" -eq 1 ]; then
  echo "Value is 1"
elif [ "$value" -eq 2 ]; then
  echo "Value is 2"
else
  echo "Value is something else"
fi
# String Comparison: Changed -eq to == because you're comparing strings, not integers.
# Using > filename (Redirecting to the file)
This method is simple and efficient. It redirects an empty output to the file, effectively clearing its contents without deleting the file itself.

# for / while / until
Used to create loops.
for: Iterates over a sequence of items (e.g., numbers or file names).
while: Executes a block of code as long as a condition is true.
until: Executes a block of code until a condition becomes true.

for i in {1..5}; do
  echo "Iteration $i"
done

# case
A switch statement used to match patterns to a variable’s value.

case "$value" in
  1) echo "One";;
  2) echo "Two";;
  *) echo "Other";;
esac

# function
Used to define a function in the script.

my_function() {
  echo "Hello, World!"
}
my_function

# return
Exits from a function and optionally returns a status code.

my_function() {
  return 1
}
my_function

# exit
Terminates the script execution.
Optionally, an exit code can be provided to indicate the script's success or failure.

exit 0  # Successful exit
exit 1  # Error exit


$ / $$ / $? / $0 / $1 ...
Special variables that provide information about the script’s execution:
$: Expands a variable’s value.
$$: Process ID of the current script.
$?: Exit status of the last command.
$0: The script name.
$1, $2, ...: Positional parameters passed to the script.

# read
Used to take input from the user or read from a file.

# Difference Between $@ and $*
$@: Expands to each argument as a separate word when quoted (i.e., "$@").
$*: Expands to all arguments as a single string when quoted (i.e., "$*") with the first character of the IFS (Internal Field Separator) as a separator between arguments.

# getting output
Using $@:
bash
hhh
hhhhhhh

Using $*:
bash hhh hhhhhhh


################################Syntaxes#######################

# if loop
if [ condition ]; then
    # Commands if condition is true
elif [ another_condition ]; then
    # Commands if the other condition is true
else
    # Commands if none of the conditions are true
fi

# for loop
for variable in list; do
    # Commands to execute for each item in the list
done

# while loop
while [ condition ]; do
    # Commands to execute while the condition is true
done

# until loop
until [ condition ]; do
    # Commands to execute until the condition becomes true
done


# Comments
; Command separator
| Pipe operator
> Output redirection
>> Append output
< Input redirection
* Wildcard (matches any characters)
? Wildcard (matches single character)
$ Variable expansion
\ Escape character
` or $() Command substitution
& Run command in background

# Special variables
$0    # Script name
$1-$9 # First 9 positional parameters
${10} # For positional parameters > 9
$#    # Number of arguments passed
$*    # All arguments as single string
$@    # All arguments as separate strings
$?    # Exit status of last command
$$    # Current process ID
$!    # PID of last background process
$-    # Current shell options
