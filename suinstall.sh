#! /usr/bin/env bash

# This script should be run to install or update any prerequisites that need to
# be installed as an administrator or sudo user.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$DIR/lib/detect.sh"

# ====== OS-specific preinstall script ====== #

if [ -f $DIR/$TARGET_OS/preinstall-su.sh ]; then
    source "$DIR/$TARGET_OS/preinstall-su.sh"
fi

# ====== App specific installation script ====== #

for i in $(ls -A "$DIR/apps")
do
    if [ -f "$DIR/apps/$i/install-su.sh" ]; then
        echo "Installing $i"
        "$DIR/apps/$i/install-su.sh"
    fi
    if [ -f "$DIR/apps/$i/install-su.$TARGET_OS.sh" ]; then
        echo "Installing $i for $TARGET_OS"
        "$DIR/apps/$i/install-su.$TARGET_OS.sh"
    fi
done

# ====== OS-specific post-install script ====== #

if [ -f "$DIR/$TARGET_OS/postinstall-su.sh" ]; then
    source "$DIR/$TARGET_OS/postinstall-su.sh"
fi
