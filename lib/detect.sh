#! /usr/bin/env bash

# ====== Detect the OS ====== #

case "$OSTYPE" in
    darwin*)
        export TARGET_OS=osx
        ;;
    linux*)
        export TARGET_OS=linux
        ;;
    *)
        export TARGET_OS=""
        ;;
esac