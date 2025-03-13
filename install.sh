#!/bin/bash

echo "Where would you like to install the script?"
echo "1) ~/.local/bin (default)"
echo "2) /usr/local/bin"
echo "3) /usr/bin"
echo "4) Custom path"

read -p "Please choose an option (1-4): " choice

case "$choice" in
    1)
        install_dir="$HOME/.local/bin"
        ;;
    2)
        install_dir="/usr/local/bin"
        ;;
    3)
        install_dir="/usr/bin"
        ;;
    4)
        read -p "Enter custom installation path: " custom_path
        install_dir="$custom_path"
        ;;
    *)
        echo "Invalid choice, using default path ~/.local/bin"
        install_dir="$HOME/.local/bin"
        ;;
esac

if [ ! -d "$install_dir" ]; then
    echo "The directory $install_dir does not exist."
    read -p "Would you like to create it? (y/n): " create_dir
    if [[ "$create_dir" == "y" || "$create_dir" == "Y" ]]; then
        mkdir -p "$install_dir"
        echo "Directory created."
    else
        echo "Installation aborted. Please create the directory manually."
        exit 1
    fi
fi

cp ./h "$install_dir/h"

chmod +x "$install_dir/h"

echo "The script is installed in $install_dir."
echo "Your current \$EDITOR is: $EDITOR"
echo "Your current \$SUDO_EDITOR is: $SUDO_EDITOR"
echo "Installed! You can use 'h' to open helix now!"

