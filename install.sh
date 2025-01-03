#!/bin/bash

# Install Fish shell if not present (Ubuntu)
if [ "$(uname)" == "Linux" ]; then
    if ! command -v fish &> /dev/null; then
        sudo apt-add-repository ppa:fish-shell/release-3
        sudo apt update
        sudo apt install fish
    fi
fi

# Create backup of existing config if it exists
if [ -d ~/.config/fish ]; then
    mv ~/.config/fish ~/.config/fish.backup-$(date +%Y%m%d)
fi

# Create config directory if it doesn't exist
mkdir -p ~/.config

# Symlink fish configuration
ln -sf $(pwd)/fish/.config/fish ~/.config/