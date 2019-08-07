#!/usr/bin/env bash

# enable autocd in bash 4.0
shopt -s autocd

# display git branch in bash prompt
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1/'
}

# https://bash.cyberciti.biz/guide/Changing_bash_prompt
# \u@\h \[\033[32m\] - user@host name and its displaying color
# \W\[\033[33m\] - current working directory and its displaying color, use \w for full path
# \$(parse_git_branch)\[\033[00m\] - git branch name and its displaying color
export PS1="[\u \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\]]$ "

# change ls dir color to purple
export LS_COLORS=$LS_COLORS:'di=0;35:'

source ~/.config/shell/aliases.sh
source ~/.config/shell/funcs.sh

export TERM=xterm # for remote session on urxvt
export TERMINAL=rxvt-unicode
export EDITOR=nvim