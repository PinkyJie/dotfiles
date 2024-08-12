#!/bin/bash

source ./_utils.sh

print_header "----------"
print_header "This script will help you setup your Ubuntu development environment."
print_header "Press Enter to continue."
print_header "----------"

read user_action
if [ ! -z $user_action ]; then
  print_header "-- Exit!"
  exit 0
fi

print_header "0. Apt update"
sudo apt update

print_header "1. Install cli tools"
# cli tools
sudo apt -y install tig fzf zsh zsh-autosuggestions vim
check_error "cli tools"

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

print_header "2. Oh My Zsh"
# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
check_error "oh-my-zsh"

# zsh theme
print_header "-- PowerLevel10k theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
check_error "zsh theme"

# SSH
print_header "3. SSH keygen"
ssh-keygen -t ed25519 -C "pinkyjie.gn@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

print_header "4. Config soft link"

# zsh
rm -f ~/.zsh ~/.zhsrc
ln -s ~/.dotfiles/zsh ~/.zsh
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc

# git
rm ~/.gitconfig
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig

# VSCode
curl -O https://go.microsoft.com/fwlink/?LinkID=760868
sudo apt install code*.deb
rm -rf code*.deb

# run VSCode once to generate User folder
code &
vscode_pid=$!
sleep 1s
kill -9 $vscode_pid

# vscode
rm -rf ~/.config/Code/User
ln -s ~/.dotfiles/vscode/User ~/.config/Code/User
print_header "-- Install vscode plugins"
cat ~/.dotfiles/vscode/extension.list | xargs -L 1 code --install-extension

print_header "5. Change default shell to zsh"
chsh -s $(which zsh)

print_header "All Done!"
