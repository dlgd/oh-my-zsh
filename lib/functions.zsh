#								-*- sh -*-

function zsh_stats() {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

function uninstall_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/uninstall.sh
}

function upgrade_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
}

function take() {
  mkdir -p $1
  cd $1
}

function e ()
{
    if [[ -n "$DISPLAY" ]]; then
        emacs -geometry 80x42 "$@" & disown
    else
        emacs "$@"
    fi
}


function ff() { find . -name '*'$1'*' ; }                 # find a file

function fstr() # find a string in a set of files
{
 if [ "$#" -ne 2 ]; then
     echo "Usage: fstr directory \"pattern\""
     return;
 fi
 find "$1" -type f -print | xargs grep -sin "$2"
}
