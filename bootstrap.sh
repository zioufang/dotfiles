#!/usr/bin/env bash

mkdir -p ~/.cache/zsh

git pull origin master;

# source file $1 to file $2, if $1 doesn't already exist in $2
function echo_source {
    ! grep -q "$1" $2 && echo "source $1" >> $2
}

function dotsync {
    # mv ~/.bashrc ~/.bashrc.old 2>/dev/null
    mv ~/.zshrc ~/.zshrc.old 2>/dev/null

    # sync the dotfiles to home directory
    rsync --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude ".git/" \
        --exclude "archived/" \
        -avh --no-perms . ~;

    # echo_source "~/.bashrc" ~/.bash_profile;

    # source ~/.bashrc;
    source ~/.zshrc 2>/dev/null;

    echo "dotfiles activated"
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
