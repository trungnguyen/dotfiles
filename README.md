James's dotfiles
================
Customisations for OS X and Ubuntu.

This repo is heavily customised for my own needs, but if you want to use it as a
template for your own dotfiles, clone it to your local machine, edit to suit,
and run ./install.sh to configure.

File layout
-----------
The directory layout is as follows:

 * **`apps`** contains configuration scripts specific to individual applications
    that are more complex than simply symlinking into the root of your home
    directory.
 * **`bin`** contains additional executable scripts to be added to your PATH.
    It will be symlinked to `~/.bin/dotfiles`; both `~/.bin` and `~/.bin/dotfiles`
    will be added to your path. You can put additional files in ~/.bin after
    installation.
 * **`home`** contains files and folders that will be symlinked to corresponding
    locations in your home directory. Existing files and folders will be backed
    up to `~/.dotfiles-backup`.
 * **`osx`** currently contains OS X-specific files. The preinstall.sh file will
    be run at the start of the install script.
 * **`setup`** contains additional scripts required by the setup process.

If you want to use these as a template for your own dotfiles, clone this
repository to your local machine, edit to suit, and run ./install.sh to
configure.