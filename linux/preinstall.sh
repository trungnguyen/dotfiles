#! /usr/bin/env bash

if ! $(which zsh); then
    sudo apt-get -y install zsh
    chsh -s `which zsh`
fi

