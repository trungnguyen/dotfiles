James's dotfiles
================
Customisations for OS X and Ubuntu.

This repo is heavily customised for my own needs, but if you want to use it as a
template for your own dotfiles, fork it to your own GitHub account, clone to
your local machine, edit to suit, and run `./install.sh` to configure.

File layout
-----------
The directory layout is as follows:

 * **`apps`** contains configuration scripts specific to individual applications
    that are more complex than simply symlinking into the root of your home
    directory.
    * Each directory within `apps` should contain a file called `install.sh`
      and/or a file called `install.<OS>.sh` where `<OS>` is either `linux` or
      `osx` to identify the target OS.
 * **`bin`** contains additional executable scripts to be added to your PATH.
    It will be symlinked to `~/.bin/dotfiles`; both `~/.bin` and `~/.bin/dotfiles`
    will be added to your path. You can put additional files in ~/.bin after
    installation.
 * **`home`** contains files and folders that will be symlinked to corresponding
    locations in your home directory. Existing files and folders will be backed
    up to `~/.dotfiles-backup`.
 * **`osx`** currently contains OS X-specific files. The `preinstall.sh` file
    will be run at the start of the install script; any file called
    `postinstall.sh` will be run at the end.
 * **`setup`** contains any additional scripts that may be required by the setup
    process.

Other notes
-----------
I'm using zsh rather than bash as my shell, so most of the scripts here will be
written with zsh in mind. Any bash support is purely accidental and entirely
coincidental. YMMV on that one.

Windows is not supported as I am currently working mainly with OSX and Ubuntu.
In addition, managing configuration on Windows presents significant additional
challenges of both a technical and cultural nature, so I have very little
incentive to do so.

For further advice and suggestions on how to manage your dotfiles, visit
[https://dotfiles.github.io/](https://dotfiles.github.io/).