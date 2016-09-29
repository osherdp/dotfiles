black=$(tput -Txterm setaf 0)
red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
lt_blue=$(tput -Txterm setaf 6)
white=$(tput -Txterm setaf 7)

bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

__has_parent_dir () {
    # utility function so we can test for things like .git/.hg without firing up a separate process
    test -d "$1" && return 0;

    current="."
    while [ ! "$current" -ef "$current/.." ]; do
        if [ -d "$current/$1" ]; then
            return 0;
        fi
        current="$current/..";
    done

    return 1;
}

__vcs_name() {
    if [ -d .svn ]; then
        echo "[svn] ";
    elif __has_parent_dir ".git"; then
        echo "[$(__git_ps1 '%s')] ";
    elif __has_parent_dir ".hg"; then
        echo "[$(hg branch)] ";
    else
        echo ""
    fi
}

__virtual_env() {
    if [ -z $VIRTUAL_ENV ]; then
        echo "";
    else
        echo "("`basename $VIRTUAL_ENV`") ";
    fi
}

__return_code() {
    if [[ $? == 0 ]]; then
        echo -ne "${green}\xe2\x9c\x93 ";
    else
        echo -ne "${red}\xe2\x9c\x97 ";
    fi
}

export VIRTUAL_ENV_DISABLE_PROMPT=1

PS1='\[$bold\]${debian_chroot:+{$debian_chroot)}$(__return_code)\[$green\]\u@\h \[$pink\]$(__virtual_env)\[$lt_blue\]$(__vcs_name)\[$dk_blue\]\w \[$white\]\d \t \[$reset\]\n\$ '

extract () {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)  tar xjf "$1"      ;;
            *.tar.gz)   tar xzf "$1"      ;;
            *.bz2)      bunzip2 "$1"      ;;
            *.rar)      unrar x "$1"      ;;
            *.gz)       gunzip "$1"       ;;
            *.tar)      tar xf "$1"       ;;
            *.tbz2)     tar xjf "$1"      ;;
            *.tgz)      tar xzf "$1"      ;;
            *.zip)      unzip "$1"        ;;
            *.ZIP)      unzip "$1"        ;;
            *.Z)        uncompress "$1"   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

alias watch="watch --color "
alias ll="ls -la --color=always"
