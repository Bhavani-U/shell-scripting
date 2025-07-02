#!/bin/bash

# Check if filename is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 filename.txt"
    exit 1
fi

# File to process
FILE="$1"

# Check if file exists
if [ ! -f "$FILE" ]; then
    echo "File not found!"
    exit 1
fi

# Process the file
echo "Top 5 most frequent words in '$FILE':"
tr -cs '[:alnum:]' '[\n*]' < "$FILE" |  # Replace non-alphanumeric characters with newline
tr 'A-Z' 'a-z' |                        # Convert to lowercase
sort |                                  # Sort words alphabetically
uniq -c |                               # Count occurrences
sort -nr |                              # Sort numerically in reverse
head -n 5                               # Show top 5 results

