#!/bin/bash

# 02 - Variables and Data Types

echo "--- Variables Demo ---"

# 1. Defining Variables
# Note: No spaces around the '=' sign!
NAME="DevOps Engineer"
AGE=25

# 2. Accessing Variables
# Use the '$' sign to access the value
echo "Hello, I am a $NAME and I am $AGE years old."

# 3. System Variables
# These are built-in variables available in the shell
echo "Current User: $USER"
echo "Home Directory: $HOME"
echo "Current Shell: $SHELL"

# 4. Command Substitution
# Storing the output of a command in a variable
HOSTNAME=$(hostname)
DATE=$(date)

echo "Running on host: $HOSTNAME"
echo "Current Date: $DATE"

# 5. Arithmetic Operations
# Using $(( )) for math
A=10
B=5

SUM=$((A + B))
DIFF=$((A - B))
MUL=$((A * B))
DIV=$((A / B))

echo "Arithmetic: $A + $B = $SUM"

# 6. Read-only Variables
readonly PI=3.14
# PI=3.15 # This would cause an error

echo "Value of PI: $PI"

echo "--- End of Demo ---"
