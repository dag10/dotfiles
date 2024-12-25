#!/bin/bash

# Uninstalls fish and all related configuration, including oh-my-fish.
# Used for locally testing a clean setup.sh.

# WARNING: This is destructive!

echo "This will uninstall Fish, Oh-My-Fish, and all related configurations."

read -p "THIS IS DESTRUCTIVE! Are you sure? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
fi

echo "Uninstalling..."

current_user=$(whoami)
current_shell=$(dscl . -read /Users/$current_user UserShell | awk '{print $2}')

if [ "$current_shell" == "/opt/homebrew/bin/fish" ]; then
  chsh -s /bin/zsh
  echo "Shell changed to /bin/zsh for user $current_user"
fi

brew uninstall fish || echo "Fish is already uninstalled"

echo "Deleting directories and configurations..."
trash -v ./oh-my-fish
trash -v /opt/homebrew/etc/fish
trash -v ~/.local/share/omf
trash -v ~/.config/omf
trash -v ~/.config/fish*

echo "Removing iTerm2 script..."
trash -F ./fish/iterm2_shell_integration.fish || echo "Already deleted."

if grep -q '/opt/homebrew/bin/fish' /etc/shells; then
  echo "Removing fish from /etc/shells..."
  sudo sed -i.bak '/\/opt\/homebrew\/bin\/fish/d' /etc/shells
fi

