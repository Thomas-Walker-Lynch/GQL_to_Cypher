#!/usr/bin/env bash

# Set the platform type: currently "Debian" or "Fedora"
PLATFORM="Fedora"

# Define the version and URL for the JDK
JDK_VERSION="22.0.1"
JDK_URL="https://github.com/adoptium/temurin22-binaries/releases/download/jdk-22.0.1%2B8/OpenJDK22U-jdk_x64_linux_hotspot_22.0.1_8.tar.gz"

# Get the project root path by removing 'executor' from the script path
script_path="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
project_root="${script_path%/*}"

# Create the upstream directory if it doesn't exist
mkdir -p "$project_root/tool/upstream"

# Download and extract JDK to the upstream directory
jdk_tar="$project_root/tool/upstream/jdk-$JDK_VERSION.tar.gz"
if [ ! -f "$jdk_tar" ]; then
  echo "Downloading JDK..."
  curl -L -o "$jdk_tar" "$JDK_URL"
fi

if [ ! -s "$jdk_tar" ]; then
  echo "JDK download failed. Exiting."
  exit 1
fi

echo "Extracting JDK..."
tar -xzf "$jdk_tar" -C "$project_root/tool/upstream" || { echo "JDK extraction failed. Exiting."; exit 1; }
rm "$jdk_tar"

# Find the extracted JDK directory
jdk_dir=$(find "$project_root/tool/upstream" -maxdepth 1 -type d -name "jdk-*" | head -n 1)
if [ -z "$jdk_dir" ]; then
  echo "JDK extraction failed. Exiting."
  exit 1
fi

# Set JAVA_HOME and update PATH to use the local JDK
export JAVA_HOME="$jdk_dir"
export PATH="$JAVA_HOME/bin:$PATH"

# Test Java installation
if ! java -version > /dev/null 2>&1; then
  echo "Java version check failed."
  exit 1
fi

echo "Java installation complete."
