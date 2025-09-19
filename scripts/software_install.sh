#!/bin/bash
# Task 6: Automated Software Installation

PACKAGE_FILE="packages.txt"
LOG_FILE="install_log.txt"

> "$LOG_FILE"

while read -r package; do
    [ -z "$package" ] && continue

    echo "Simulating installation of $package..."
    sleep 1  # fake delay

    if [ $((RANDOM % 2)) -eq 0 ]; then
        echo "$package: Installed successfully" >> "$LOG_FILE"
    else
        echo "$package: Installation failed" >> "$LOG_FILE"
    fi
done < "$PACKAGE_FILE"

echo "Simulation complete. Log saved in $LOG_FILE"

