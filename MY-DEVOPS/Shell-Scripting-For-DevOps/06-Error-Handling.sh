#!/bin/bash

# 06 - Error Handling

echo "--- Error Handling Demo ---"

# 1. Exit Codes
# Every command returns an exit code (0 = success, non-zero = failure)
ls /tmp > /dev/null
if [ $? -eq 0 ]; then
    echo "Command 'ls /tmp' succeeded."
else
    echo "Command failed."
fi

# 2. Stop on Error (set -e)
# Uncomment the next line to stop script execution immediately if a command fails
# set -e

# ls non_existent_folder
# echo "This line will not print if 'set -e' is active and the above command fails."

# 3. Debugging (set -x)
# Prints each command before executing it
# set -x
echo "Debugging is useful for troubleshooting."
# set +x # Turn off debugging

# 4. Trap
# Execute a command when the script exits or receives a signal
cleanup() {
    echo "Cleaning up temporary files..."
    rm -f temp_file.txt
}

trap cleanup EXIT

echo "Creating a temp file..."
touch temp_file.txt
echo "Script is finishing..."
# When this script ends (successfully or not), 'cleanup' will run.

echo "--- End of Demo ---"
