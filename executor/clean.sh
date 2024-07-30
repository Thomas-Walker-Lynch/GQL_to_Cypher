#!/usr/bin/env bash

# Get the project root path by removing 'executor' from the script path
script_path="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
project_root="${script_path%/*}"

# Function to handle errors
handle_error() {
    echo "Error occurred during cleaning. Exiting."
    exit 1
}

# Remove the contents of the tool directory while preserving the directory itself and .gitignore
find "$project_root/tool" -mindepth 1 ! -name ".gitignore" -exec rm -rf {} + || handle_error

# Unset environment variables if they are set
[ -n "$JAVA_HOME" ] && unset JAVA_HOME
[ -n "$CLASSPATH" ] && unset CLASSPATH

echo "Project clean complete. All tools have been removed."
