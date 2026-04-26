#!/bin/bash

# 03 - Control Flow (If-Else, Loops, Case)

echo "--- Control Flow Demo ---"

# 1. If-Else Statements
echo "Checking if user is root..."
if [ $(id -u) -eq 0 ]; then
    echo "You are root."
else
    echo "You are NOT root."
fi

# 2. File Conditions
FILE="README.md"
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
    echo "$FILE does not exist."
fi

# 3. For Loops
echo "Counting to 5:"
for i in {1..5}; do
    echo "Number: $i"
done

echo "Iterating over files:"
for script in *.sh; do
    echo "Found script: $script"
done

# 4. While Loops
echo "While loop demo:"
COUNT=1
while [ $COUNT -le 3 ]; do
    echo "Count is $COUNT"
    ((COUNT++))
done

# 5. Case Statements
echo "Enter a fruit (apple/banana/orange):"
read FRUIT

case "$FRUIT" in
    "apple")
        echo "Apple pie is delicious."
        ;;
    "banana")
        echo "Banana bread is yummy."
        ;;
    "orange")
        echo "Orange juice is refreshing."
        ;;
    *)
        echo "Unknown fruit."
        ;;
esac

echo "--- End of Demo ---"
