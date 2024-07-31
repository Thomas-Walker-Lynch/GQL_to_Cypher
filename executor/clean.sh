#!/usr/bin/env bash

# Get the project root path by removing 'executor' from the script path
script_path="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
project_root="${script_path%/*}"

# Function to handle errors
handle_error() {
  echo "Error occurred during cleaning. Exiting."
  exit 1
}

# Call specific clean scripts
./clean_Java.sh || { echo "Java cleanup failed."; }
./clean_ANTLR.sh || { echo "ANTLR cleanup failed."; }

# Remove the contents of the tool directory while preserving the directory itself and .gitignore
find "$project_root/tool" -mindepth 1 -maxdepth 1 -not -name ".gitignore" -not -name "upstream" -not -type l -exec rm -rf {} + || handle_error
find "$project_root/tool" -maxdepth 1 -type l -exec rm -f {} + || handle_error

echo 'Tool directory cleanup complete. Run `clean_upstream.sh` to remove cached upstream files.'
