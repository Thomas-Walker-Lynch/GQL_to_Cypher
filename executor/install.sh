#!/usr/bin/env bash

# Set the platform type: currently "Debian" or "Fedora"
PLATFORM="Fedora"

# Define the version and URL for the JDK
JDK_VERSION="17.0.2"
JDK_URL="https://download.oracle.com/java/17/latest/jdk-$JDK_VERSION_linux-x64_bin.tar.gz"

# Get the project root path by removing 'executor' from the script path
script_path="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
project_root="${script_path%/*}"

# Create the tool/executor directory if it doesn't exist
mkdir -p "$project_root/tool/executor"

# Create a symbolic link tool/bin pointing to tool/executor
ln -sfn "$project_root/tool/executor" "$project_root/tool/bin"

# Download and extract JDK to the tool directory
curl -L -o "$project_root/tool/jdk-$JDK_VERSION.tar.gz" "$JDK_URL"
tar -xzf "$project_root/tool/jdk-$JDK_VERSION.tar.gz" -C "$project_root/tool"
rm "$project_root/tool/jdk-$JDK_VERSION.tar.gz"

# Set JAVA_HOME and update PATH to use the local JDK
export JAVA_HOME="$project_root/tool/jdk-$JDK_VERSION"
export PATH="$JAVA_HOME/bin:$PATH"

# Move the JDK binaries to the tool/executor directory
mv "$JAVA_HOME/bin/"* "$project_root/tool/executor/"
rm -rf "$JAVA_HOME/bin"

# Download ANTLR jar file and place it in the tool/executor directory
curl -o "$project_root/tool/executor/antlr-4.9.2-complete.jar" https://www.antlr.org/download/antlr-4.9.2-complete.jar

# Set environment variables for ANTLR
export CLASSPATH=".:$project_root/tool/executor/antlr-4.9.2-complete.jar:$CLASSPATH"
export PATH="$PATH:$project_root/tool/executor"

echo "Installation complete. Java and ANTLR have been installed."
