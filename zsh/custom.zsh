export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export NVM_DIR="$HOME/.nvm"

if [[ $IS_MAC -eq 1 ]]; then
    # powerlevel10k zsh theme
    source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

    # nvm
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    # fzf
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

    # zsh-autosuggestions
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [[ $IS_LINUX -eq 1 ]]; then
    #powerlevel10k zsh theme
    ZSH_THEME="powerlevel10k/powerlevel10k"

    # nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    # fzf
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    source /usr/share/doc/fzf/examples/completion.zsh

    # zsh-autosuggestions
     source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
