#!/bin/bash

# Check if zsh is installed
if ! command -v zsh &> /dev/null
then
    echo "zsh is not installed. Installing zsh..."
    brew install zsh

    
else
    echo "zsh is already installed."
fi

# Check if oh-my-zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]
then
    echo "oh-my-zsh is not installed. Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
    chsh -s $(which zsh)
    exec zsh
else
    echo "oh-my-zsh is already installed."
fi

echo "Setting zsh as default shell ..."
chsh -s $(which zsh)
echo "Current shell: $SHELL"
$SHELL --version

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
# Check if Node is already installed with Volta
if volta list | grep "node" >/dev/null 2>&1; then
  echo "Node is already installed with Volta. Skipping installation."
else
  # Install Node with Volta
  volta install node
  echo "Node has been installed with Volta."
fi


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

