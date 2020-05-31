#!/bin/bash
# launch fuzzy matched bookmark in browser

BOOKMARKS=${HOME}/.scripts/fzfcmds/bookmarks
FZF_ARGS="--reverse"

# Display the menu and get the selection
SELECTION=`sed '/^#/d;/^$/d;/^ /d' ${BOOKMARKS} | awk '{print $1}' | ${HOME}/.fzf/bin/fzf ${FZF_ARGS}`

if [ "${SELECTION}" ]; then
	# Get the text associated with the selection.
	URL=`grep "${SELECTION}" ${BOOKMARKS} | sed "s/${SELECTION} //"`
fi

# lnch to launches a process and moves it out of the process group
# to ensure when term window closes, the spawned child process is moved out
if [ "${URL}" ]; then
	~/go/bin/lnch ${BROWSER} ${URL}
fi

exit
