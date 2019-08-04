#!/usr/bin/env bash

git pull origin master;

# source file $1 to file $2, if $1 doesn't already exist in $2
function echo_source {
    ! grep -q "$1" $2 && echo "source $1" >> $2
}

function dotsync {
    # sync the dotfiles to home directory
    rsync --exclude "bootstrap.sh" \
        --exclude "bootstrap.zsh" \
        --exclude "README.md" \
        --exclude ".config/zsh/" \
        --exclude ".git/" \
        -avh --no-perms . ~;

    # add bash scripts to .bashrc in a new instance
    # configs before aliases to make default tmux start work
    echo_source "~/.config/bash/configs.sh" ~/.bashrc;
    echo_source "~/.config/shell/aliases.sh" ~/.bashrc;
    #echo_source "~/.config/shell/funcs.sh" ~/.bashrc;

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

