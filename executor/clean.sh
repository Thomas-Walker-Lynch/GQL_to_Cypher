#!/usr/bin/env bash

# Check if REPO_HOME is set, if not exit with an error
if [ -z "$REPO_HOME" ]; then
  echo "REPO_HOME is not set. Please initialize the environment."
  exit 1
fi

# Function to handle errors
handle_error() {
  echo "Error occurred during cleaning. Exiting."
  exit 1
}

# Call specific clean scripts
"$REPO_HOME/executor/clean_Java" || { echo "Java cleanup failed."; }
"$REPO_HOME/executor/clean_ANTLR" || { echo "ANTLR cleanup failed."; }

# Remove the contents of the tool directory while preserving the directory itself and .gitignore
find "$REPO_HOME/tool" -mindepth 1 -maxdepth 1 -not -name ".gitignore" -not -name "upstream" -not -type l -exec rm -rf {} + || handle_error
find "$REPO_HOME/tool" -maxdepth 1 -type l -exec rm -f {} + || handle_error

echo "Tool directory cleanup complete."
