#!/usr/bin/env bash

# Exit on first error
set -e

# Set the platform type: currently "Debian" or "Fedora"
PLATFORM="Fedora"

# Define the versions and URLs for the JDK and ANTLR
JDK_VERSION="17.0.2"
JDK_URL="https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.2%2B8/OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8.tar.gz"
ANTLR_VERSION="4.9.2"
ANTLR_URL="https://www.antlr.org/download/antlr-$ANTLR_VERSION-complete.jar"

# Get the project root path by removing 'executor' from the script path
script_path="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
project_root="${script_path%/*}"

# Create the tool/executor directory if it doesn't exist
mkdir -p "$project_root/tool/executor"

# Create a symbolic link tool/bin pointing to tool/executor
ln -sfn "$project_root/tool/executor" "$project_root/tool/bin"

# Function to handle errors
handle_error() {
    echo "Error occurred during installation. Exiting."
    exit 1
}

# Download and extract JDK to the tool directory
curl -L -o "$project_root/tool/jdk-$JDK_VERSION.tar.gz" "$JDK_URL" || handle_error

# Check if the download was successful
if [ ! -s "$project_root/tool/jdk-$JDK_VERSION.tar.gz" ]; then
    echo "JDK download failed. Exiting."
    exit 1
fi

tar -xzf "$project_root/tool/jdk-$JDK_VERSION.tar.gz" -C "$project_root/tool" || handle_error
rm "$project_root/tool/jdk-$JDK_VERSION.tar.gz"

# Find the extracted JDK directory
jdk_dir=$(find "$project_root/tool" -maxdepth 1 -type d -name "jdk-*" | head -n 1)
if [ -z "$jdk_dir" ]; then
    echo "JDK extraction failed. Exiting."
    exit 1
fi

# Set JAVA_HOME and update PATH to use the local JDK
export JAVA_HOME="$jdk_dir"
export PATH="$JAVA_HOME/bin:$PATH"

# Move the JDK binaries to the tool/executor directory
mv "$JAVA_HOME/bin/"* "$project_root/tool/executor/" || handle_error
rm -rf "$JAVA_HOME/bin"

# Download ANTLR jar file and place it in the tool/executor directory
curl -o "$project_root/tool/executor/antlr-$ANTLR_VERSION-complete.jar" "$ANTLR_URL" || handle_error

# Check if the download was successful
if [ ! -s "$project_root/tool/executor/antlr-$ANTLR_VERSION-complete.jar" ]; then
    echo "ANTLR download failed. Exiting."
    exit 1
fi

# Set environment variables for ANTLR
export CLASSPATH=".:$project_root/tool/executor/antlr-$ANTLR_VERSION-complete.jar:$CLASSPATH"
export PATH="$PATH:$project_root/tool/executor"

echo "Installation complete. Java and ANTLR have been installed successfully."
# echo "To set the environment variables for future sessions, add the following lines to your ~/.bashrc or ~/.bash_profile:"
# echo "export JAVA_HOME=\"$JAVA_HOME\""
# echo "export PATH=\"$JAVA_HOME/bin:$PATH:$project_root/tool/executor\""
# echo "export CLASSPATH=\"$CLASSPATH\""
