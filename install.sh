#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo ""
echo "###############################"
echo "# Setup symlinks              #"
echo "###############################"

# Setup symlinks
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

echo ""
echo "###############################"
echo "# Install software            #"
echo "###############################"

# Install Homebrew
is_installed brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off

brew install git-crypt
brew install zsh-syntax-highlighting
brew install magic-wormhole
brew tap caskroom/cask

# Install Apps
brew cask install dropbox
brew cask install iterm2
brew cask install spectacle
brew cask install phpstorm
brew cask install whatsapp
brew cask install sequel-pro
