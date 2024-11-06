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

# Setup private ssh key
mkdir ~/.ssh

# Install Homebrew
is_installed brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off

brew install git-crypt
brew install zsh-syntax-highlighting
brew install kubernetes-cli
brew install awscli
brew install jq
brew install jsonnet
brew install aws-vault
brew install composer

brew install tfenv
# https://medium.com/@immanoj42/terraform-template-v2-2-0-does-not-have-a-package-available-mac-m1-m2-2b12c6281ea
brew install kreuzwerker/taps/m1-terraform-provider-helper
m1-terraform-provider-helper activate # (In case you have not activated the helper)
m1-terraform-provider-helper install  hashicorp/template 2.10.0 # Install and compile

# Setup npm
touch ~/.npmrc

# Configure: https://github.com/finanzcheck/terraform-provider-spinnaker
# $ mkdir ~/.spin
# $ vim ~/.spin/config # paste content from above repository readme

# Install Apps
brew install --cask atom
brew install --cask slack
brew install --cask dropbox
brew install --cask iterm2
brew install --cask rectangle
brew install --cask phpstorm
brew install --cask whatsapp
brew install --cask sequel-ace
brew install --cask postman
