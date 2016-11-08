#!/bin/bash
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[$(tput setaf 10)\]\[$(tput bold)\]\u\[$(tput sgr0)\]\[$(tput setaf 14)\] \w\[$(tput setaf 9)\]\$(parse_git_branch)\n\[$(tput setaf 8)\]\!\[$(tput setaf 15)\] $ "
