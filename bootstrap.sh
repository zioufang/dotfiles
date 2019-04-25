#!/usr/bin/env bash

git pull origin master;

function dotsync {
    # add .bash_* to .bashrc in a new instance
    [ ! -f ~/.bash_aliases] && echo 'source ~/.bash_aliases' >> ~/.bashrc;
    [ ! -f ~/.bash_configs] && echo 'source ~/.bash_configs' >> ~/.bashrc;
    [ ! -f ~/.bash_functions] && echo 'source ~/.bash_functions' >> ~/.bashrc;

    # sync the dotfiles to home directory
    rsync --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude ".git/" \
        --exclude "bin/" \
        --exclude "vscode/" \
        -avh --no-perms . ~;

    source ~/.bashrc;
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

