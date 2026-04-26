#!/bin/bash

# 05 - Input and Output (Read, Redirection, Pipes)

echo "--- Input/Output Demo ---"

# 1. Reading User Input
echo "What is your favorite cloud provider?"
read CLOUD
echo "You chose: $CLOUD"

# Reading with a prompt (one line)
read -p "Enter your favorite CI/CD tool: " TOOL
echo "Great choice: $TOOL"

# 2. Output Redirection
# > Overwrites the file
echo "This is a log entry." > app.log
echo "Log file created."

# >> Appends to the file
echo "Another log entry." >> app.log
echo "Log file updated."

echo "Displaying app.log content:"
cat app.log

# 3. Standard Error (stderr)
# 1 is stdout (default), 2 is stderr
ls non_existent_file 2> error.log
echo "Error logged to error.log (check content if 'ls' failed)"

# 4. Pipes (|)
# Passing output of one command as input to another
echo "Listing all files and filtering for '.sh':"
ls -l | grep ".sh"

echo "Counting number of script files:"
ls | grep ".sh" | wc -l

echo "--- End of Demo ---"
