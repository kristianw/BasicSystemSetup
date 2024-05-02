#!/bin/bash

# Install Homebrew
echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" < /dev/null

# Ensure Brew is in the PATH
echo "export PATH=/usr/local/bin:$PATH" >> ~/.bash_profile && source ~/.bash_profile

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
# apps=(    
#     "/Applications/Google Chrome.app"
#     "/Applications/Visual Studio Code.app"
#     "/Applications/1Password for Safari.app"
#     "/Applications/1Password.app"
#     "/Applications/AppCleaner 2.app"
#     "/Applications/Arc.app"
#     "/Applications/Bartender\ 5.app"
#     "/Applications/Beeper.app"
#     "/Applications/Bruno.app"
#     "/Applications/Dark\ Noise.app"
#     "/Applications/Dark\ Reader\ for\ Safari.app"
#     "/Applications/Docker.app"
#     "/Applications/Elgato\ Wave\ Link.app"
#     "/Applications/Fantastical.app"
#     "/Applications/Fork.app"
#     "/Applications/Google\ Chrome.app"
#     "/Applications/Hyperkey.app"
#     "/Applications/JetBrains\ Toolbox.app"
#     "/Applications/JumpCloud\ Password\ Manager\ for\ Safari.app"
#     "/Applications/Notion.app"
#     "/Applications/Proxyman.app"
#     "/Applications/Raycast.app"
#     "/Applications/Replacicon.app"
#     "/Applications/Safari.app"
#     "/Applications/Screens\ 4.app"
#     "/Applications/Setapp.app"
#     "/Applications/Slack.app"
#     "/Applications/SnippetsLab.app"
#     "/Applications/Spotify.app"
#     "/Applications/The Unarchiver.app"
#     "/Applications/Things3.app"
#     "/Applications/ToothFairy.app"
#     "/Applications/Velja.app"
#     "/Applications/Vimari.app"
#     "/Applications/Visual\ Studio\ Code.app"
#     "/Applications/Warp.app"
# )

# for app in "${apps[@]}"; do    
#     # Remove the com.apple.quarantine attribute    
#     sudo xattr -dr com.apple.quarantine "$app"
# done
