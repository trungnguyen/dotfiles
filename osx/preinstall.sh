#! /usr/bin/env bash

# ====== Install requirements with homebrew ====== #

# Make sure homebrew is installed

which brew > /dev/null 2> /dev/null
if (( $? != 0 )); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2
# Install the latest zsh
brew install zsh
# Install python 3
brew install python3

# ====== Configuration ====== #

# Add latest bash and zsh to list of shells
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
fi;

# Add latest bash and zsh to list of shells
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
fi;

# TODO: swap to using zsh once it's configured properly
if [[ $(finger -l | grep -o -e Shell:.* | cut -d' ' -f2) != "/usr/local/bin/zsh" ]]; then
    chsh -s /usr/local/bin/zsh
fi