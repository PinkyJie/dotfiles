# Currently this path is appended to dynamically when picking a ruby version
# zshenv has already started PATH with rbenv so append only here
#export PATH=$PATH:/usr/local/bin:/usr/local/sbin:$HOME/bin

# remove duplicate entries
typeset -U PATH

export JAVA_HOME="$(/usr/libexec/java_home)"
export ANDROID_HOME=/usr/local/lib/android
export ANDROID_SDK_ROOT=/usr/local/lib/android

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
if [[ $IS_MAC -eq 1 ]]; then
    export EDITOR='vim'
fi
if [[ $IS_LINUX -eq 1 ]]; then
    export EDITOR='vim'
fi

# Set LC_ALL="UTF8"
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# Virtual Environment Stuff
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# if [[ $HAS_VIRTUALENV -eq 1 ]]; then
#     source /usr/local/bin/virtualenvwrapper.sh
# fi

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

fpath=(/usr/local/share/zsh/site-functions $fpath)

export DENO_INSTALL="/Users/wenbo/.deno"
export PATH="$PATH:$DENO_INSTALL/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$ANDROID_HOME/cmdline-tools/tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/build-tools/29.0.3:$HOME/Projects/depot_tools"
