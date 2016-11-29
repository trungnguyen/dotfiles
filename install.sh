#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! [ -f ~/.dotfiles-backup ]; then
    mkdir -p ~/.dotfiles-backup
fi

# ====== Symlink all dotfiles and dotfolders into root directory ====== #

for I in $(ls -A $DIR/link)
do
    if [ -f ~/$I ] || [ -h ~/$I ]; then
        if ! [ -e ~/.dotfiles-backup/$I ]; then
            echo Backing up $I to ./dotfiles-backup
            mv ~/$I ~/.dotfiles-backup
        else
            rm ~/$I
        fi
    fi
    ln -s $DIR/link/$I ~/$I
done

# ====== Append to path ====== #

mkdir -p ~/.bin
ln -fhs $DIR/bin ~/.bin/dotfiles

# ====== Configure vim ====== #

if ! [ -d $DIR/link/.vim/bundle ]; then
    mkdir -p $DIR/link/.vim/bundle
    git clone https://github.com/gmarik/vundle $DIR/link/.vim/bundle/vundle
    vim -C +PluginInstall +qa!
fi
