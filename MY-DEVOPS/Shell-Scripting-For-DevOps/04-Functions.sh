#!/bin/bash

# 04 - Functions

echo "--- Functions Demo ---"

# 1. Defining a Function
greet() {
    echo "Hello from the greet function!"
}

# Calling the function
greet

# 2. Passing Arguments
greet_user() {
    echo "Hello, $1! Welcome to $2."
}

greet_user "Alice" "DevOps World"
greet_user "Bob" "Shell Scripting"

# 3. Return Values
# Functions in bash return an exit status (0-255), not a value like other languages.
# To return a value, we usually echo it and capture it.

add() {
    local sum=$(( $1 + $2 ))
    echo $sum
}

RESULT=$(add 10 20)
echo "The sum of 10 and 20 is: $RESULT"

# 4. Local Variables
# Use 'local' to keep variables inside the function scope
my_function() {
    local inside_var="I am local"
    echo $inside_var
}

my_function
# echo $inside_var # This would be empty/error because it's local

echo "--- End of Demo ---"
