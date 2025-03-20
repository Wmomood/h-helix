#!/bin/bash

file="$1"

# Function to check write permission
needs_root() {
    if [ -z "$1" ]; then
        [ -w "$(pwd)" ] || return 0
    elif [ -e "$1" ]; then
        [ -w "$1" ] || return 0
    else
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
    if [ ! -d "$(dirname "$file")" ]; then
        create_directory "$file"
    fi
fi

if [ -z "$file" ]; then
    helix
    exit 0
fi

# If the file requires root privileges
if needs_root "$file"; then
    # Try to open the file using sudoedit
    if sudoedit "$file"; then
        echo "File edited successfully with sudoedit."
    else
        # If sudoedit fails, create a temporary file and use Helix
        tmpfile="$(mktemp --suffix=.hxedit)"
        sudo cp "$file" "$tmpfile"
        sudo chown "$USER" "$tmpfile"  # Allow the current user to edit the file

        # Open the temporary file with Helix
        helix "$tmpfile"

        # Check if changes were made
        if ! diff -q "$file" "$tmpfile" > /dev/null; then
            echo "Changes detected. Overwrite the original file? (y/N)"
            read -r confirm
            if [[ "$confirm" =~ ^[Yy]$ ]]; then
                sudo mv "$tmpfile" "$file"
                echo "File updated successfully."
            else
                echo "Changes discarded."
                rm "$tmpfile"
            fi
        else
            echo "No changes made."
            rm "$tmpfile"
        fi
    fi
else
    # For regular files, open Helix normally
    helix "$file"
fi
