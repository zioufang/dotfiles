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
    ek="emacsclient -e '(kill-emacs)'" \
    er="emacsclient -e '(kill-emacs)' && emacs --daemon"

# search terminal history
alias hg="history | grep"

# python
alias pyvenv="python3 -m venv .venv" \
    pyv="source .venv/bin/activate"
