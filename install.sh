#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for I in $(ls -A | grep -v -e "^\.git\(ignore\|attributes\)\?$" | grep ^\\.)
do
    if [ -f ~/$I ]; then
        rm ~/$I
    fi
    ln -s $DIR/$I ~/$I
done
