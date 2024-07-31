#!/usr/bin/env bash

# Call install scripts and handle errors
./install_Java.sh || { echo "Java installation failed. "; }
./install_ANTLR.sh || { echo "ANTLR installation failed."; exit 1; }

# Create symbolic link
script_path="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
project_root="${script_path%/*}"

ln -sfn "$project_root/tool/executor" "$project_root/tool/bin"

echo "All installations complete. Java and ANTLR have been installed successfully."
