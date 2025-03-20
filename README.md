# Helix Editor Script
This script allows you to quickly open the Helix editor using the h command. It checks whether the provided file or directory exists and has proper write permissions. If the file or directory does not exist, it will prompt you to create it. The script also checks if you need root privileges to edit the file. If so, it creates a temporary copy of the file for editing and, after saving, prompts you to overwrite the original file if there were any changes.

## Features
- Checks if the file exists and if it is writable.
- If the directory of the file does not exist, it will prompt the user to create it.
- If root privileges are required, it uses a temporary copy of the file for editing.
- Prompts the user to overwrite the original file if changes are detected.
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

