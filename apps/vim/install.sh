#! /usr/bin/env bash

# ====== Configure vim ====== #

if ! [ -d ~/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    vim -C +PluginInstall +qa!
fi