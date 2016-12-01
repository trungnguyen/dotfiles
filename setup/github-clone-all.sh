#! /usr/bin/env bash

mkdir -p ~/abc/github

for I in $(curl -s https://api.github.com/users/jammycakes/repos | jq -r .[].name)
do
    if [ -e ~/abc/github/$I ]; then
        echo Already cloned $I
    else
        git clone git@github.com:jammycakes/$I ~/abc/github/$I
    fi
done