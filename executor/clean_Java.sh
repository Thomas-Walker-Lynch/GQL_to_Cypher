#!/usr/bin/env bash

# Get the project root path by removing 'executor' from the script path
script_path="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
project_root="${script_path%/*}"

# Function to handle errors
handle_error() {
  echo "Error occurred during Java cleanup. Exiting."
  exit 1
}

# Clean the JDK directory
jdk_dir="$project_root/tool/upstream/jdk-*"
if [ -d "$jdk_dir" ]; then
  find "$jdk_dir" -mindepth 1 -maxdepth 1 -not -type l -exec rm -rf {} + || handle_error
  find "$jdk_dir" -maxdepth 1 -type l -exec rm -f {} + || handle_error
else
  echo "JDK directory does not exist."
fi

echo "Java cleanup complete."
