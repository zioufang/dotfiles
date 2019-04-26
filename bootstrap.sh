#!/usr/bin/env bash

git pull origin master;

# source file $1 to file $2, if $1 doesn't already exist in $2
function echo_source {
    ! grep -q "$1" $2 && echo "source $1" >> $2
}

function dotsync {
    # sync the dotfiles to home directory
    rsync --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude ".git/" \
        --exclude "vscode/" \
        -avh --no-perms . ~;

    # add bash scripts to .bashrc in a new instance
    echo_source "~/.bash/bash_aliases.sh" ~/.bashrc;
    echo_source "~/.bash/bash_configs.sh" ~/.bashrc;
    echo_source "~/.bash/bash_functions.sh" ~/.bashrc;
    
    echo_source "~/.bashrc" ~/.bash_profile;

    source ~/.bashrc;
    echo "bash dotfiles activated"
}

if [ "$1"=="-f" ]; then
    dotsync;
else
    read -p "this may overwrite existing files (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        dotsync;
    fi;
fi;

