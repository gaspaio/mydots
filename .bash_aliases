alias rc=". ~/.bash_profile"
alias rca=". ~/.bash_aliases"

# Check dotfiles dir from any location
alias dotup="CURR=$(pwd); cd $HOME/.dotfiles; git pull; cd $CURR;"
alias dotst="CURR=$(pwd); cd ~/.dotfiles; git st; cd $CURR;"

# Vim
alias vim-rtmp="rm -f $HOME/.vim/swap/* $HOME/.vim/backup/*"

# some more ls aliases
alias l='ls -CF'
alias ll='ls -alF'
alias la="ls -Fha"
alias lla="ls -lhFA"

# One liners
alias rmrf="rm -rf"
alias v="vim"
alias c="clear"
alias isup="pgrep -lf"
alias g="git"
function rline() {
    # rline myfile 52
    sed "'${2}q;d'" $1
}

alias p="python"
alias pipup="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
alias ip="ipython --pylab"
alias jup="jupyter-notebook $1 &> /dev/null &"
alias jupl="jupyter notebook list"
alias jupk="pgrep -f jupyter | xargs kill"
jupexport() {
    jupyter nbconvert $1 --template=nbextensions --to=html
}
# Anaconda Python
ca() {  # activate conda env
    source activate $1
}

alias cad="source deactivate"
alias cal="conda env list"

alias cdpr="cd ~/Projects"
alias cddl="cd ~/Downloads"
alias cddo="cd ~/Documents"

# Docker
alias d="docker"
alias dc="docker-compose"
alias drm="docker ps -q -a | xargs docker rm -f"
alias drmi="docker images -q | xargs docker rmi -f"
alias drmv="docker volume ls -q | xargs docker volume rm"
alias dpurge="drm && drmi && drmv"

# Minikube & kubectl
alias k=kubectl
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kgns='kubectl get namespaces'
alias kgall='kubectl get ingress,service,deployment,pod'
alias kuc='kubectl config use-context'
alias ksc='kubectl config set-context "$(kubectl config current-context)"'
alias kns='ksc --namespace'
alias kgc='kubectl config get-contexts'

kc() {
    k8scurrentconf=$(kubectl config get-contexts | grep '*')
    cluster=$(echo "$k8scurrentconf" | awk '{print $2}')
    namespace=$(echo "$k8scurrentconf" | awk '{print $5}')

    echo "($cluster, $namespace)"
}


alias mnkcreate="minikube start --vm-driver=xhyve && minikube addons enable ingress"
alias mnkdel="minikube delete"
kbapply() {
    kubectl apply -f ~/Projects/kubernetes/k8s-gconf/$1
}
kbreplace() {
    kubectl replace -f ~/Projects/kubernetes/k8s-gconf/$1
}
kbdel() {
    kubectl delete namespace $1
    # TODO wait until its gone
}
kbsh() {
    kubectl exec -ti --namespace=$1 $2 -c $3 sh
}
kbpf() {
    kubectl port-forward --namespace=$1 $2 $3
}
gcelogin() {
    docker login -u _token -p $(gcloud auth --project radio-france-k8s print-access-token) https://eu.gcr.io
}

# TMUX
alias tmux="tmux -2"        # Always start tmux in 256 colors
# - kill tmux server if its running
alias tmux-kill="if [ $(pgrep tmux | wc -l) -gt 1 ]; then tmux ls | awk {print$1} | cut -d: -f1 | xargs -I{} tmux kill-session -t {}; fi"

# Docker
# Fetch the IP of a container: dockerip container_name
dockerip() {
    docker inspect $1 | grep -m 1 \"IPAddress\": | cut -d ':' -f 2 | cut -d '"' -f 2
}

# Crawl and download a site
# dlsite www.domain.ext dir1/dir2/page
dlsite() {
    wget --recursive --no-clobber --page-requisites --html-extension --convert-links --domains $1 --no-parent $1/$2
}

md2html() {
    pandoc $1.md -f markdown -t html -s -o $1.html
}

cgrep() {
    cat $1 | grep $2 --context=${3:-0}
}

# OSX Only
# Show/Hide hidden Files / Folders
# alias hfshow='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
# alias hfhide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'



