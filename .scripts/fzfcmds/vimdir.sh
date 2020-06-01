#!/bin/sh
# Cannot use ENV from zshrc as this is usually run with sxhkd keybindings
prefix=/home/zio/projects/
output=$(/usr/bin/autojump -s | grep -v '^0.0' | grep $prefix | sed '1!G;h;$!d' | awk '{print $2}' | sed -e "s|^$prefix||" | ~/.fzf/bin/fzf --height=30% --reverse)
~/go/bin/lnch $TERMINAL -e nvim $prefix$output
