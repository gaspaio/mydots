# If you come from bash you might have to change your $PATH.
# PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/python/libexec/bin:$PATH
# export PATH=/Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home/bin:$PATH
# export PATH=/Applications/Docker.app/Contents/Resources/bin:$PATH
export PATH=$HOME/.local/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="/Users/rripado/.oh-my-zsh"
export ZSH="/home/rripado/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
DEFAULT_USER=rripado

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  colorize
  command-not-found
  docker
  git
  history
  python
  ssh-agent
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8


# Java
# export JAVA=/Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home/bin/java
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Python: dont write pyc files (https://docs.python-guide.org/writing/gotchas/#disabling-bytecode-pyc-files)
export PYTHONDONTWRITEBYTECODE=1

# Python: request multiprocessing error in high sierra (https://stackoverflow.com/questions/50168647/multiprocessing-causes-python-to-crash-and-gives-an-error-may-have-been-in-progr)
# export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Completion for kubectl
source <(kubectl completion zsh)

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v="vim"
alias cdp="cd ~/Projects"
alias isup="pgrep -lf"
alias g="git"
alias gr="grep -irn"

function rline() {
    # rline myfile 52
    sed "'${2}q;d'" $1
}

alias p="python"
alias pipup="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
alias ip="ipython"

function venv() {
    envname=${1:-.env}
    echo Activating $envname
    source ./$envname/bin/activate
}

# Show/Hide hidden Files / Folders
# alias hfshow='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
# alias hfhide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Docker
alias d="docker"
alias dc="docker-compose"
alias drm="docker ps -q -a | xargs docker rm -f"
alias drmi="docker images -q | xargs docker rmi -f"
alias drmv="docker volume ls -q | xargs docker volume rm"
alias dpurge="drm && drmi && drmv"

function add-mono-chan() {
    pacmd load-module module-remap-sink sink_name=mono master=$(pacmd list-sinks | grep -m 1 -oP 'name:\s<\K.*(?=>)') channels=2 channel_map=mono,mono
    echo "Added 'mono' output chan"
}
alias del-mono-chan="pacmd unload-module module-remap-sink"

# Deezer aliases
source $HOME/.aliases_dzr

