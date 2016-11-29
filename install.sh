#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! [ -f ~/.dotfiles-backup/home ]; then
    mkdir -p ~/.dotfiles-backup/home
fi
if ! [ -f ~/.dotfiles-backup/local ]; then
    mkdir -p ~/.dotfiles-backup/local
fi

# ====== Symlink all dotfiles and dotfolders into root directory ====== #

for I in $(ls -A $DIR/home)
do
    if [ -e ~/$I ]; then
        if ! [ -e ~/.dotfiles-backup/home/$I ]; then
            echo Backing up $I to .dotfiles-backup/home
            mv ~/$I ~/.dotfiles-backup/home
        else
            rm ~/$I
        fi
    fi
    ln -s $DIR/home/$I ~/$I
done

# ====== Append to path ====== #

mkdir -p ~/.bin
if ! [ -e $DIR/bin ]; then
    ln -s $DIR/bin ~/.bin/dotfiles
fi

# ====== Configure vim ====== #

if ! [ -d ~/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    vim -C +PluginInstall +qa!
fi
