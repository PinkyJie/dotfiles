#!/bin/bash

echo "----------"
echo "This script will help you setup your development environment."
echo "Make sure you have already installed Xcode tool: xcode-select --install"
echo "Press Enter to continue."
echo "----------"
echo

read user_action
if [ ! -z $user_action ]; then
  echo "== Exit!"
  exit 0
fi

checkError() {
  if [ $? -eq 0 ]; then
    echo "== Install $1: success!"
    echo
  else
    echo "== Install $1: fail!"
    echo "== Exit!"
    exit 1
  fi
}

echo "1. Install Homebrew"
echo "----------"

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
checkError "homebrew"

# node
echo -e "\n\n==== Node ===\n\n"
brew install node
checkError "node"
echo "== Check node version:"
echo "node -v"
node -v
echo "npm -v"
npm -v

# common command line tool
echo -e "\n\n==== Command Line Tool ====\n\n"
echo "== Will install: aria2 wget git diff-so-fancy proxychains-ng tig zsh z tmux"
brew install aria2 wget curl git diff-so-fancy proxychains-ng tig zsh z tmux
checkError "command line tool"

# oh my zsh
cur_path=`pwd`
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
checkError "oh-my-zsh"

# zsh-autosugesstion
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo "2. Install homebrew-cask"
echo "----------"

# homebrew-cask
brew tap caskroom/cask
checkError "homebrew-cask"

# software
echo -e "\n\n==== Software ====\n\n"
echo "== Will install: alfred iterm2 vscode google-chrome aliwangwang skitch appcleaner jitouch licecap mplayerx biaduinput skype youdao sourcetree insomniax qq spectacle shadowsocksx the-unarchiver java"
brew cask install alfred iterm2 visual-studio-code google-chrome aliwangwang skitch appcleaner jitouch licecap mplayerx biaduinput skype youdao sourcetree insomniax qq spectacle shadowsocksx the-unarchiver java
checkError "Software"

echo "3. SSH keygen"
echo "----------"
ssh-keygen -t rsa -b 4096 -C pinkyjie.gn@gmail.com
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

echo "4. Config soft link"
echo "----------"

# zsh
rm -f ~/.zsh ~/.zhsrc ~/.zshenv ~/.zprofile
ln -s ~/.dotfiles/zsh ~/.zsh
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/zshenv ~/.zshenv
ln -s ~/.dotfiles/zsh/zprofile ~/.zprofile

# oh-my-zsh
cp ~/.dotfiles/ohmyzsh/* ~/.oh-my-zsh/themes/

# ssh
ln -s ~/.dotfiles/ssh/config ~/.ssh/config

# git
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/gitignore_global ~/.gitignore_global

# tmux
ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

# vscode
rm -rf ~/Library/Application\ Support/Code/User
ln -s ~/.dotfiles/vscode/User ~/Library/Application\ Support/Code/User
echo "== Install vscode plugins"
cat ~/.dotfiles/vscode/extension.list | xargs -L 1 code-insiders --install-extension

# aria2
mkdir ~/.aria2
ln -s ~/.dotfiles/aria2/aria2.conf ~/.aria2/aria2.conf

# proxychains
mkdir ~/.proxychains
ln -s ~/.dotfiles/proxychains/proxychains.conf ~/.proxychains/proxychains.conf

checkError "soft link"

echo "5. Switch Shell to zsh"
chsh -s /bin/zsh

echo -e "\n\n== All Done!"
