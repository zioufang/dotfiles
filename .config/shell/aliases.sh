#!/bin/sh
alias ..="cd .." \
    ...="cd ../.." \
    ....="cd ../../.." \
    a="apt-get" \
    p="pacman" \
    g=git \
    vim=nvim \
    mkdir="mkdir -pv" \
    hcat="highlight --out-format=ansi" \
    ls="ls --color=auto" \
    code="code --disable-gpu" \
    ws="bspc desktop -n"

alias ll="LC_COLLATE=C ls -lh --group-directories-first "     # readable ls, dotfiles first
alias ld="ll | grep '^d'"   # ls dir only

# search terminal history
alias hg="history | grep"

# python
alias pyvenv="python3 -m venv venv" \
    pyv="source venv/bin/activate"
