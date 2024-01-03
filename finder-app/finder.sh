#!/bin/bash

# Assigning arguments to variables
filesdir=$1
searchstr=$2

# Check if both arguments are provided
if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
    echo "Error: Both directory and search string are required"
    exit 1
fi

# Check if the directory exists
if [ ! -d "$filesdir" ]; then
    echo "Error: Specified directory does not exist"
    exit 1
fi

# Count the number of files
num_files=$(find "$filesdir" -type f | wc -l)

# Count the number of matching lines
num_matches=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print the results
echo "The number of files are $num_files and the number of matching lines are $num_matches"

