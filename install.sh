#! /usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Detect the OS

case "$OSTYPE" in
    darwin*)
        TARGET_OS=osx
        ;;
    linux*)
        TARGET_OS=linux
        ;;
    *)
        TARGET_OS=""
        ;;
esac

if [ -f $DIR/$TARGET_OS/preinstall.sh ]; then
    . $DIR/$TARGET_OS/preinstall.sh
fi


if ! [ -f ~/.dotfiles-backup/home ]; then
    mkdir -p ~/.dotfiles-backup/home
fi
if ! [ -f ~/.dotfiles-backup/files ]; then
    mkdir -p ~/.dotfiles-backup/files
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

# ====== Do the files directory ====== #

$DIR/apps/vscode/install.sh

# ====== Configure vim ====== #

if ! [ -d ~/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    vim -C +PluginInstall +qa!
fi

if [ -f $DIR/$TARGET_OS/postinstall.sh ]; then
    . $DIR/$TARGET_OS/postinstall.sh
fi

