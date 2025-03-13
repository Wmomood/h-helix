#!/bin/bash

# Get the file or directory (can be empty)
file="$1"

# Function to check write permission
needs_root() {
    if [ -z "$1" ]; then
        # No file provided, check the current directory
        [ -w "$(pwd)" ] || return 0
    elif [ -e "$1" ]; then
        # If the file exists, check if it's writable
        [ -w "$1" ] || return 0
    else
        # If the file doesn't exist, check if the parent directory is writable
        [ -w "$(dirname "$1")" ] || return 0
    fi
    return 1
}

# Function to ask if the directory should be created
create_directory() {
    echo "The directory $(dirname "$1") does not exist. Would you like to create it? (y/n)"
    read -r answer
    if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
        mkdir -p "$(dirname "$1")"
        echo "Directory created."
    else
        echo "Directory creation aborted."
        exit 1
    fi
}

# Check if the file or directory exists
if [ -n "$file" ] && [ ! -e "$file" ]; then
    # If the target file or directory does not exist, ask to create the directory
    if [ ! -d "$(dirname "$file")" ]; then
        create_directory "$file"
    fi
fi

# Check if root privileges are needed
if needs_root "$file"; then
    if [ -z "$file" ]; then
        # No file provided, open sudoedit in the current directory
        sudoedit "$(pwd)/untitled"
    else
        sudoedit "$file"
    fi
else
    if [ -z "$file" ]; then
        # No file provided, just open helix in the current directory
        helix
    else
        helix "$file"
    fi
fi

