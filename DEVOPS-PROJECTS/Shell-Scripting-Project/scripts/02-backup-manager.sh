#!/bin/bash

# Goal: Backup a specific folder and save it with a timestamp.

SOURCE_DIR="/var/www/html"   # Directory to backup (Example)
BACKUP_DIR="/backup"         # Where to save it
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILENAME="backup_$TIMESTAMP.tar.gz"

echo "Starting backup of $SOURCE_DIR..."

# In a real scenario, we would check if directory exists first
# if [ -d "$SOURCE_DIR" ]; then ...

# Using 'tar' to zip files
# -c : create
# -z : compress (gzip)
# -f : filename
echo "Creating archive: $BACKUP_FILENAME"
# tar -czf $BACKUP_DIR/$BACKUP_FILENAME $SOURCE_DIR

echo "Backup simulation complete! (Uncomment 'tar' line to make it real)"
