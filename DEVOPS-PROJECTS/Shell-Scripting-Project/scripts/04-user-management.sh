#!/bin/bash

# Goal: Create multiple users using a Loop.

USERS=("alice" "bob" "charlie" "dave")

echo "Starting User Creation..."

# For Loop
for user in "${USERS[@]}"; do
    echo "Creating user: $user"
    # sudo useradd $user
    # echo "User $user created successfully."
done

echo "All users processed!"
