#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

case "$OSTYPE" in
    darwin*)
        CONFIG_LOCATION=~/"Library/Application Support/Code/User/settings.json"
        ;;
    linux*)
        CONFIG_LOCATION=~/.config/Code/User/settings.json
        ;;
    *)
        CONFIG_LOCATION=""
        ;;
esac

rm -f "$CONFIG_LOCATION"
ln -s "$DIR/vscode.settings.json" "$CONFIG_LOCATION"

for I in $(cat $DIR/extensions.txt)
do
    code --install-extension $I
done