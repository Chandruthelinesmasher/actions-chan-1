#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define log file
LOG_FILE="dragon.txt"

# Function to install cowsay if not already installed
install_cowsay() {
    if ! command -v cowsay &> /dev/null; then
        echo "Installing cowsay..."
        sudo apt-get update && sudo apt-get install cowsay -y
    else
        echo "cowsay is already installed."
    fi
}

# Generate dragon message
generate_dragon_message() {
    local message="Run for cover, I am a DRAGON...RAWR"
    cowsay -f dragon "$message" | tee "$LOG_FILE"
}

# Search for keyword in log
search_dragon_log() {
    echo "Searching for 'dragon' in $LOG_FILE..."
    grep -i "dragon" "$LOG_FILE" || echo "No match found."
}

# Display log contents
display_log() {
    echo "Contents of $LOG_FILE:"
    cat "$LOG_FILE"
}

# List current directory contents
list_directory() {
    echo "Listing files in current directory:"
    ls -ltra
}

# Main execution
main() {
    install_cowsay
    generate_dragon_message
    search_dragon_log
    display_log
    list_directory
}

main