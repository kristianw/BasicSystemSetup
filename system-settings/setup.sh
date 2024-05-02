#!/bin/bash

# Set default folder for storing screenshots
# Create the directory if it doesn't exist
mkdir -p ~/Documents/screenshots/
# Sets it as default location for screenshots
defaults write com.apple.screencapture location ~/Documents/screenshots/


# Install fonts
# Copy fonts to the Fonts directory
cp -a ./fonts/. ~/Library/Fonts

# Copy .gitconfig to the home directory
#cp ./system-settings/.gitconfig ~

# Copy .zshrc config
#cp ./system-settings/.zshrc ~

# Set up dev directory
#mkdir ~/dev

# Set up dev env
volta install node
