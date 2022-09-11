#!/bin/sh

selected=`cat ~/.local/bin/tmux-cht-lists/languages ~/.local/bin/tmux-cht-lists/commands | fzf --reverse`

if [[ -z $selected ]]; then
    exit 0
fi

if grep -qs "$selected" ~/.local/bin/tmux-cht-lists/languages; then
    read -p "Enter Query: " query
    query=`echo $query | tr ' ' '+'`
    tmux neww sh -c "curl -s cht.sh/$selected/$query | less -r"
else
    tmux neww sh -c "curl -s cht.sh/$selected | less -r"
fi
