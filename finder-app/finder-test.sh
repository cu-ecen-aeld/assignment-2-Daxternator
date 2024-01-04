#!/bin/bash

# Clean any previous build artifacts
make clean

# Compile your writer application using native compilation
make

# Use your "writer" utility instead of "writer.sh" shell script
./writer "Hello, World!" output.txt

# Additional testing steps if required

# Exit with success status
exit 0

