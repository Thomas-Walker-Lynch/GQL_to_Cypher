#!/usr/bin/env bash

# Get the project root path by removing 'executor' from the script path
script_path="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
project_root="${script_path%/*}"

# Function to handle errors
handle_error() {
  echo "Error occurred during ANTLR cleanup. Exiting."
  exit 1
}

# Clean the ANTLR directory
antlr_dir="$project_root/tool/upstream/antlr4-*"
if [ -d "$antlr_dir" ]; then
  find "$antlr_dir" -mindepth 1 -maxdepth 1 -not -type l -exec rm -rf {} + || handle_error
  find "$antlr_dir" -maxdepth 1 -type l -exec rm -f {} + || handle_error
else
  echo "ANTLR directory does not exist."
fi

echo "ANTLR cleanup complete."
