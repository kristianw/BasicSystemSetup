#!/bin/bash

# Install fonts
# Copy fonts to the Fonts directory
cp -a ./fonts/. ~/Library/Fonts

# Copy .gitconfig to the home directory
cp ./system-settings/.gitconfig ~

# Copy .zshrc config
cp ./system-settings/.zshrc ~

# Set up dev directory
mkdir ~/dev

# Set up dev env
volta install node

# MacOS Customisations

## Set default folder for storing screenshots
## Create the directory if it doesn't exist
mkdir -p ~/Documents/screenshots/

## Sets it as default location for screenshots
defaults write com.apple.screencapture location ~/Documents/screenshots/

## Show all hidden files
defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder

## Show recent applications in Dock
defaults write com.apple.dock "show-recents" -bool false

## Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

## Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

