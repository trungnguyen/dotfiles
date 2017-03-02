#! /usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

case "$OSTYPE" in
    darwin*)
        CONFIG_LOCATION=~/"Library/Application Support/Code/User"
        ;;
    linux*)
        CONFIG_LOCATION=~/.config/Code/User
        ;;
    *)
        CONFIG_LOCATION=""
        ;;
esac

rm -f "$CONFIG_LOCATION/settings.json"
ln -s "$DIR/vscode.settings.json" "$CONFIG_LOCATION/settings.json"

rm -f "$CONFIG_LOCATION/keybindings.json"
if [ -f "$DIR/vscode.keybindings.$TARGET_OS.json" ]; then
    ln -s "$DIR/vscode.keybindings.$TARGET_OS.json" "$CONFIG_LOCATION/keybindings.json"
elif [ -f "$DIR/vscode.keybindings.json" ]; then
    ln -s "$DIR/vscode.keybindings.json" "$CONFIG_LOCATION/keybindings.json"
fi

rm -rf "$CONFIG_LOCATION/snippets"
ln -s "$DIR/snippets" "$CONFIG_LOCATION/snippets"

for I in $(cat $DIR/extensions.txt)
do
    code --install-extension $I
done