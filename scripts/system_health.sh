#!/bin/bash

LOG_FILE="$HOME/system_health.log"

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')


MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_FREE=$(free -m | awk '/Mem:/ {print $4}')
MEM_USED_PERCENT=$(( ( (MEM_TOTAL - MEM_FREE) * 100 ) / MEM_TOTAL ))


TIME=$(date '+%Y-%m-%d %H:%M:%S')

STATUS="OK"

if [ "$(printf "%.0f" "$CPU_USAGE")" -gt 80 ] || [ "$MEM_USED_PERCENT" -gt 80 ]; then
  STATUS="WARNING: High usage!"
fi

echo "$TIME | CPU: ${CPU_USAGE}% | Memory: ${MEM_USED_PERCENT}% | $STATUS" >> "$LOG_FILE"
