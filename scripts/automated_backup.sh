#!/bin/bash
# Automated backup script

# Ask user for directory
read -p "Enter the directory path to backup: " DIR_PATH

# Check if directory exists
if [ ! -d "$DIR_PATH" ]; then
  echo "Error: Directory does not exist."
  exit 1
fi

# Get current date
CURRENT_DATE=$(date '+%Y-%m-%d')

# Get directory name
DIR_NAME=$(basename "$DIR_PATH")

# Create backup filename
BACKUP_FILE="backup_${DIR_NAME}_${CURRENT_DATE}.tar.gz"

# Compress the directory
tar -czf "$BACKUP_FILE" -C "$(dirname "$DIR_PATH")" "$DIR_NAME"

echo "Backup complete! File saved as $BACKUP_FILE"

