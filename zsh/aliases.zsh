alias zsh-reload='source ~/.zshrc'
alias ll='ls -al'

if [[ $IS_MAC -eq 1 ]]; then
    alias bu='brew update; brew upgrade; brew cleanup; brew doctor'
fi
