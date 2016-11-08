#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for I in $(ls -A | grep -v -e "^\.git\(ignore\|attributes\)\?$" | grep ^\\.)
do
    if [ -f ~/$I ]; then
        rm ~/$I
    fi
    ln -s $DIR/$I ~/$I
done

mkdir -p $DIR/.vim/bundle
git clone https://github.com/gmarik/vundle $DIR/vim/bundle/vundle
vim -C +PluginInstall +qa!