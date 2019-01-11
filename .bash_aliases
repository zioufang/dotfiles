#!/usr/bin/env bash

# easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# list out PATH
alias path='echo $PATH | tr -s ":" "\n"'

#
alias vi=vim
alias svim="sudo vim"
alias tgz="tar -zxvf"
alias tbz='tar -jxvf'
alias df="df -h"            # show disk space in mb instead of kb
alias wget="wget -c"        # enable resume downloads
alias ll="ls -lh -sort"     # readable ls

# get external ip
alias getip="curl ipinfo.io/ip"

# top memory and cpu usage
# add '-<number>' to the end to change no. of rows
alias pscpu="ps auxf | sort -nr -k 3 | head" 
alias psmem="ps auxf | sort -nr -k 4 | head"

# search terminal history
alias hg="history | grep"

# docker prune
alias dprune="docker system prune --volumes -f"