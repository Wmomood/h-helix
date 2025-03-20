# Helix Editor Script
This script allows you to quickly open the Helix editor using the `h` command. It checks whether the provided file or directory exists and has proper write permissions. If the file or directory does not exist, it will prompt you to create it. The script also checks if root privileges are required to edit the file. If so, it attempts to use `sudoedit` to open the file. If `sudoedit` fails, a temporary copy of the file is created for editing. After saving, it prompts you to overwrite the original file if there were any changes.

## Features
- Checks if the file exists and if it is writable.
- If the directory of the file does not exist, it will prompt the user to create it.
- Opens files with `sudoedit` if root privileges are needed, preserving file ownership and permissions.
- If `sudoedit` fails (due to writable directories), it creates a temporary file and opens it with Helix.
- After editing, it prompts to overwrite the original file if changes were detected.
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

