#!/bin/bash

# Detect installed Helix command
if command -v helix &> /dev/null; then
    detected_command="helix"
    detected_script="h-helix"
elif command -v hx &> /dev/null; then
    detected_command="hx"
    detected_script="h-hx"
else
    echo "Neither 'helix' nor 'hx' was found. Please install Helix first."
    exit 1
fi

# Ask user which command they use to launch Helix
echo "Which command do you use to start Helix?"
echo "1) helix"
echo "2) hx"
read -p "Press Enter to use the detected option [$detected_command]: " user_choice

case "$user_choice" in
    1) selected_command="helix"; selected_script="h-helix" ;;
    2) selected_command="hx"; selected_script="h-hx" ;;
    *) selected_command="$detected_command"; selected_script="$detected_script" ;;
esac

echo "You selected: $selected_command (Installing $selected_script)"

# Choose installation path
echo "Where would you like to install the script?"
echo "1) ~/.local/bin (default)"
echo "2) /usr/local/bin"
echo "3) /usr/bin"
echo "4) Custom path"
read -p "Press Enter to use the default path [~/.local/bin]: " path_choice

case "$path_choice" in
    1) install_dir="$HOME/.local/bin" ;;
    2) install_dir="/usr/local/bin" ;;
    3) install_dir="/usr/bin" ;;
    4) read -p "Enter custom installation path: " custom_path
       install_dir="$custom_path"
       ;;
    *) install_dir="$HOME/.local/bin" ;;
esac

echo "Selected installation path: $install_dir"

# Ensure the install directory exists
if [ ! -d "$install_dir" ]; then
    echo "The directory $install_dir does not exist."
    read -p "Would you like to create it? (y/n): " create_dir
    if [[ "$create_dir" =~ ^[Yy]$ ]]; then
        mkdir -p "$install_dir"
        echo "Directory created."
    else
        echo "Installation aborted. Please create the directory manually."
        exit 1
    fi
fi

# Copy and rename the script
cp "./$selected_script" "$install_dir/h"
chmod +x "$install_dir/h"

# Display installation info
echo "The script '$selected_script' has been installed as 'h' in $install_dir."
echo "Your current \$EDITOR is: $EDITOR"
echo "Your current \$SUDO_EDITOR is: $SUDO_EDITOR"
echo "Installed! You can use 'h' to open Helix now!"
