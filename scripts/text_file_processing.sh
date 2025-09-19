#!/bin/bash
# Task 7: Text File Processing
# Takes a text file as input
# Counts and displays the number of lines, words, and characters in the file
# Finds and displays the longest word in the file.

file="sample.txt"

lines=$(wc -l < "$file")
words=$(wc -w < "$file")
chars=$(wc -m < "$file")

longest_word=$(tr -s '[:space:]' '\n' < "$file" | awk '{ if (length > max) { max = length; word = $0 } } END { print word }')

echo "File name: $file"
echo "Number of lines: $lines"
echo "Number of words: $words"
echo "Number of characters: $chars"
echo "Longest word: $longest_word"

