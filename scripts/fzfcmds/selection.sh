#!/bin/bash
# this scripts use fzf to select the first column of a whitespace delmited file
# and return the rest into stdout

SOURCE=$1

# delete empty lines or ones start with '#' or whitespace
# then use fzf to select
SELECTION=$(sed '/^#/d;/^$/d;/^ /d' "${SOURCE}" | awk '{print $1}' | fzf)


if [ "${SELECTION}" ]; then
  # Get the text associated with the selection
  # remove any leading whitespaces
  OUTPUT=$(grep "${SELECTION}" "${SOURCE}" | sed "s/${SELECTION} //" | sed "s/^[[:space:]]*//")
fi

echo "${OUTPUT}"
