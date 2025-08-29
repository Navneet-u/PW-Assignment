#!/bin/bash

mkdir -p ~/backup

for f in *.txt
do
    name="${f%.txt}"
    date_time=$(date +"%Y%m%d_%H%M%S")
    cp "$f" ~/backup/"${name}_$date_time.txt"
done

echo "Backup Done"

