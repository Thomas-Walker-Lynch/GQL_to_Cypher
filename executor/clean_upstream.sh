#!/usr/bin/env bash

# Get the project root path by removing 'executor' from the script path
script_path="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
project_root="${script_path%/*}"

# Function to handle errors
handle_error() {
  echo "Error occurred during upstream cleanup. Exiting."
  exit 1
}

# Check if the upstream directory exists
if [ -d "$project_root/tool/upstream" ]; then
  echo "Cleaning up upstream directory..."
  find "$project_root/tool/upstream" -mindepth 1 -maxdepth 1 -not -type l -exec rm -rf {} + || handle_error
  find "$project_root/tool/upstream" -maxdepth 1 -type l -exec rm -f {} + || handle_error
else
  echo "Upstream directory does not exist."
fi

echo "Upstream cleanup complete."
