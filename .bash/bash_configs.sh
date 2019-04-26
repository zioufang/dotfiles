#!/usr/bin/env bash

# set PATH so it includes system wide sbin if it exists
if [ -d "/usr/local/sbin" ] ; then
    PATH="/usr/local/sbin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's local bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

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

# THIS NEEDS to be before any alias to work
# run tmux as default if
# 1 tmux exists on the system
# 2 in an interactive shell
# 3 tmux doesn't try to run within itself

# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi