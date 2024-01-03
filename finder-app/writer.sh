#!/bin/bash

# Assigning arguments to variables
writefile=$1
writestr=$2

# Check if both arguments are provided
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Error: Both file path and write string are required"
    exit 1
fi
#Create the directory if it doesnt exist (the -p ensures this happends)
mkdir -p "$(dirname "$writefile")"

#Write the string
echo "$writestr" > "$writefile"
# Check if it worked well
if [ $? -ne 0 ]; then
    echo "Error: Could not write to file"
    exit 1
fi

