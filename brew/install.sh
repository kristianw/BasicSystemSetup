#!/bin/bash

# Install Homebrew
echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" < /dev/null

# Enable the brew command
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install packages using the Brewfile
brew bundle --file=./brew/Brewfile

# Create the .zshrc file if it doesn't exist
touch ~/.zshrc

# Append this line to the end of the ~/.zshrc file
echo 'source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh' > ~/.zshrc

# When installing any software from the internet
# Apple will warn you about it being unsafe the first time you open it
# Add to the list below all the apps you want to declare as safe to skip the warnings
apps=(    
    "/Application/Google Chrome.app"    
    "/Application/Visual Studio Code.app"
    "/Application/1Password for Safari.app"
    "/Application/1Password.app"
    "/Application/AppCleaner 2.app"
    "/Application/Arc.app"
    "/Application/Bartender 5.app"
    "/Application/Beeper.app"
    "/Application/Bruno.app"
    "/Application/Dark Noise.app"
    "/Application/Dark Reader for Safari.app"
    "/Application/Docker.app"
    "/Application/Elgato Wave Link.app"
    "/Application/Fantastical.app"
    "/Application/Fork.app"
    "/Application/Google Chrome.app"
    "/Application/Hyperkey.app"
    "/Application/JetBrains Toolbox.app"
    "/Application/JumpCloud Password Manager for Safari.app"
    "/Application/Notion.app"
    "/Application/Proxyman.app"
    "/Application/Raycast.app"
    "/Application/Replacicon.app"
    "/Application/Safari.app"
    "/Application/Screens 4.app"
    "/Application/Setapp.app"
    "/Application/Slack.app"
    "/Application/SnippetsLab.app"
    "/Application/Spotify.app"
    "/Application/The Unarchiver.app"
    "/Application/Things3.app"
    "/Application/ToothFairy.app"
    "/Application/Velja.app"
    "/Application/Vimari.app"
    "/Application/Visual Studio Code.app"
    "/Application/Warp.app"
)

for app in "${apps[@]}"; do    
    # Remove the com.apple.quarantine attribute    
    sudo xattr -dr com.apple.quarantine "$app"
done
