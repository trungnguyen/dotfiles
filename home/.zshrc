#! /usr/bin/env zsh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="%B%F{green}%n %F{cyan}%~%F{red}$(parse_git_branch)"$'\n'"%F{black}%h %f$ "

alias ls="ls -G"

PATH=$PATH:~/.bin:~/.bin/dotfiles