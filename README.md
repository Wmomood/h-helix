# Helix Editor Script
This script allows you to quickly open the Helix editor using the `h` command. It checks whether the provided file or directory exists and has proper write permissions. If the file or directory does not exist, it will prompt you to create it. It also checks if you need root privileges to edit the file and uses `sudoedit` if needed.

## Features
- Checks if the file exists and if it is writable.
- If the directory of the file does not exist, it will prompt the user to create it.
- Opens the file with the appropriate editor (Helix or sudoedit) based on the file's permissions.

## Installation

```
git clone https://github.com/Wmomood/h-helix.git
cd h-helix
chmod +x install.sh
./install.sh
```
Ensure that ~/.local/bin is included in your PATH environment variable(If you use the default installation path). This is required for the h command to work properly.

## Usage
Just like Helix:
```bash
h <file_path>
# If no file is provided, Helix will launch Helix without opening a specific file.
```

## Requirements

  - [Helix Editor](https://github.com/helix-editor/helix)

## Configure sudoedit to use Helix

When root access is needed, `sudoedit` will be used to open the file. If you want use Helix for sudoedit, you can try adding the following line to your shell configuration file (e.g., .bashrc, .zshrc, etc.):
```bash
export EDITOR="helix" # (or hx)
export SUDO_EDITOR="helix" # (or hx)
```
