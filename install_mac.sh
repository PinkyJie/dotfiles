#!/bin/bash

source ./_utils.sh

print_header "----------"
print_header "This script will help you setup your Mac development environment."
print_header "Make sure you have already installed Xcode tool: xcode-select --install"
print_header "Press Enter to continue."
print_header "----------"

read user_action
if [ ! -z $user_action ]; then
  print_header "-- Exit!"
  exit 0
fi

print_header "1. Install Homebrew"
# homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
check_error "homebrew"

# cli tools
print_header "-- Homebrew CLI tools"
brew install git diff-so-fancy tig nvm fzf zsh-autosuggestions
check_error "homebrew cli tools"

# fzf keybindings
print_header "-- fzf keybindings"
$(brew --prefix)/opt/fzf/install

# apps
print_header "-- Homebrew apps"
brew install --cask warp visual-studio-code google-chrome appcleaner iina spectacle
check_error "homebrew apps"

print_header "2. Oh My Zsh"
# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
check_error "oh-my-zsh"

# zsh theme
print_header "-- PowerLevel10k theme"
brew install romkatv/powerlevel10k/powerlevel10k
check_error "zsh theme"

print_header "3. SSH keygen"
ssh-keygen -t rsa -b 4096 -C pinkyjie.gn@gmail.com
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

print_header "4. Config soft link"

# zsh
rm -f ~/.zsh ~/.zhsrc
ln -s ~/.dotfiles/zsh ~/.zsh
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc

# ssh
ln -s ~/.dotfiles/ssh/config ~/.ssh/config

# git
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig

# run VSCode once to generate User folder
code &
vscode_pid=$!
sleep 1s
kill -9 $vscode_pid

# vscode
rm -rf ~/Library/Application\ Support/Code/User
ln -s ~/.dotfiles/vscode/User ~/Library/Application\ Support/Code/User
print_header "-- Install vscode plugins"
cat ~/.dotfiles/vscode/extension.list | xargs -L 1 code --install-extension

print_header "\n\nAll Done!"
