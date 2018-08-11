# Commands history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

alias suvim="sudo -E vim"

export WORKON_HOME=~HOME/.virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
source /usr/bin/virtualenvwrapper.sh

dockerclean() {
    docker rm `docker ps -a -q`
    docker rmi `docker images -q`
}
alias bip="printf '\7'"
alias ipy="ipython"

function dif() {
    git diff master...$(git rev-parse --abbrev-ref HEAD)
}
