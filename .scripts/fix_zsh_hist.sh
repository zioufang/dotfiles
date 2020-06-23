#!/bin/zsh
export ZSHIST=~/.cache/zsh/history
mv $ZSHIST $ZSHIST_bad
mv $ZSHIST ${ZSHIST}_bad
strings ${ZSHIST}_bad > $ZSHIST
fc -R $ZSHIST
