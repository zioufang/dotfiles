~!/usr/bin/env bash

git pull origin master;

function dotsync() {
    # sync the dotfiles to home directory
    rsync --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude ".git/" \
        -avh --no-perms . ~;

    # add stuff to .bashrc
    echo '\
source ~/.bash_aliases
source ~/.bash_functions
source ~/.bash_paths
' >> ~/.bashrc

    # run .bashrc in bash_profile
    echo 'source ~/.bashrc' >> ~/.bash_profile
    source ~/.bash_profile
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

