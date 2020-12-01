#!/bin/sh
alias ..="cd .." \
    ...="cd ../.." \
    ....="cd ../../.." \
    g=git \
    vim=nvim \
    vv="nvim ." \
    d=docker \
    mkdir="mkdir -pv" \
    cat="bat --paging=never --style=plain" \
    ls="ls --color=auto"

alias ll="LC_COLLATE=C ls -lh --group-directories-first "     # readable ls, dotfiles first

# search terminal history
alias hg="history | grep"

# python
alias pyvenv="python3 -m venv venv" \
    pyv="source venv/bin/activate"
