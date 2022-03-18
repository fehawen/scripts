#!/bin/sh

match="^[a-zA-Z0-9]\+@[a-zA-Z0-9]\+\.[a-z]\{2,\}"

if [ "$#" -ne "1" ] || printf '%s\n' "$1" | grep -qv -e "$match"; then
    printf 'Usage: %s <email_address>\n' "${0##*/}"
    exit 0
fi

ssh-keygen -t ed25519 -C "$1"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

printf 'SSH key generated.\n'
cat ~/.ssh/id_ed25519.pub
