#!/bin/bash

# This is a comment. It helps humans read the code.

# 1. Variables (Storing data)
NAME="DevOps Engineer"
CURRENT_DATE=$(date)

# 2. Output (Printing to screen)
echo "-------------------------------------"
echo "Hello, $NAME!"
echo "The current time is: $CURRENT_DATE"
echo "-------------------------------------"

# 3. User Input
echo "What is your favorite cloud provider? (AWS/Azure/GCP)"
read CLOUD

echo "That is cool! $CLOUD is a great choice."
