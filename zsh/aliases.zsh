alias zsh-reload='source ~/.zshrc'
alias ll='ls -al'

if [[ $IS_MAC -eq 1 ]]; then
    alias bu='brew update; brew upgrade; brew cleanup; brew doctor'
fi

function scp-docker() {
    scp ~/.dotfiles/homelab/.env wenbo@pi4:~/docker/.env
    scp ~/.dotfiles/homelab/docker-compose.yaml wenbo@pi4:~/docker/docker-compose.yml
}
