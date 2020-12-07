OS="$(uname)"
DOTFILES_DIR=$HOME"/.dotfiles"
BREW_PREFIX="/usr/local"
export $OS
PROJECTS_DIR=$HOME/Projects

# If not running interactively, don't do anything
[ -z "$PS1"  ] && return

# Bash History
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend                 # append to the history file, don't overwrite it
export HISTSIZE=10000               # Keep at most 10k commands in history
export HISTFILESIZE=10000
export HISTTIMEFORMAT='%F %T  '     # Display time in history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"   # After each command, save and reload history
export HISTIGNORE='ls -*:lla:ll:pwd:date:'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Base16 shell colors
# https://github.com/chriskempson/base16-shell
BASE16_SHELL=$DOTFILES_DIR"/base16-shell/scripts/base16-solarized-dark.sh"
[[ -s $BASE16_SHELL  ]] && source $BASE16_SHELL

# Simple pip bash completion
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip

export GOPATH=$PROJECTS_DIR/golang

export PATH="$HOME/bin:$HOME/anaconda3/bin:$GOPATH/bin:/usr/local/bin:/usr/local/sbin:$PATH"
#export PATH="$HOME/bin:$GOPATH/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NODEJS_ORG_MIRROR=http://nodejs.org/dist

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Git bash completion
if [ -f $BREW_PREFIX/git/contrib/completion/git-completion.bash ]; then
    . $BREW_PREFIX/git/contrib/completion/git-completion.bash
fi

# Support for Brew:bash-completion
if [ -f $BREW_PREFIX/etc/bash_completion ]; then
    . $BREW_PREFIX/etc/bash_completion
fi

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export CLICOLOR=1

BGP_SCRIPT="$BREW_PREFIX/opt/bash-git-prompt/share/gitprompt.sh"

if [ -f $BGP_SCRIPT ]; then
    GIT_PROMPT_THEME=Solarized
    GIT_PROMPT_ONLY_IN_REPO=1
    GIT_PROMPT_FETCH_REMOTE_STATUS=0
    GIT_PROMPT_END=" \n $ "
    source $BGP_SCRIPT
fi

# Simplest bash prompt ever
export PS1=" \W $ "

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.bash.inc' ]; then source '/opt/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.bash.inc' ]; then source '/opt/google-cloud-sdk/completion.bash.inc'; fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

