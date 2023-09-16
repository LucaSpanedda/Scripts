#!/bin/bash
# Run a script on terminal directly taken from github

# Check if an argument has been provided
if [ -z "$1" ]; then
    echo "You must provide an argument!"
    exit 1
fi

# Use the provided argument
arg=$1

# Execute the curl command with the argument
curl -s "https://raw.githubusercontent.com/$arg" | bash
