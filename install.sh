#!/usr/bin/env bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Use the latest Homebrew
brew update

# Install Homebrew packages
brew install node
brew install rbenv

brew install gh
brew install tmux
brew install tree
brew install yarn
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

brew install zsh

# Change default shell to zsh
chsh -s $(which zsh)

# Install Oh-my-zsh
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended