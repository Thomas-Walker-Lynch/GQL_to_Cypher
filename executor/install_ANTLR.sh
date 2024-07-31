#!/usr/bin/env bash

# Define the version and URL for ANTLR
ANTLR_VERSION="4.11.1"
ANTLR_URL="https://github.com/antlr/antlr4/archive/refs/tags/4.11.1.tar.gz"

# Get the project root path by removing 'executor' from the script path
script_path="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
project_root="${script_path%/*}"

# Create the upstream directory if it doesn't exist
mkdir -p "$project_root/tool/upstream"

# Download ANTLR tarball and extract to the upstream directory
antlr_tar="$project_root/tool/upstream/antlr-$ANTLR_VERSION.tar.gz"
if [ ! -f "$antlr_tar" ]; then
  echo "Downloading ANTLR..."
  curl -L -o "$antlr_tar" "$ANTLR_URL"
fi

if [ ! -s "$antlr_tar" ]; then
  echo "ANTLR download failed. Exiting."
  exit 1
fi

echo "Extracting ANTLR..."
tar -xzf "$antlr_tar" -C "$project_root/tool/upstream" || { echo "ANTLR extraction failed. Exiting."; exit 1; }
rm "$antlr_tar"

# Move the ANTLR jar to the executor directory
antlr_jar="$project_root/tool/upstream/antlr-$ANTLR_VERSION-complete.jar"
if [ ! -f "$antlr_jar" ]; then
  echo "ANTLR JAR file not found after extraction. Exiting."
  exit 1
fi

mkdir -p "$project_root/tool/executor"
mv "$antlr_jar" "$project_root/tool/executor/"

echo "ANTLR installation complete."
