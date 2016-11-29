#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# ====== Symlink all dotfiles and dotfolders into root directory ====== #

for I in $(ls -A $DIR/link)
do
    if [ -f ~/$I ] || [ -h ~/$I ]; then
        rm ~/$I
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
