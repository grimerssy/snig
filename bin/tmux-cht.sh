#!/bin/sh

selected=`cat ~/.local/bin/tmux-cht/languages ~/.local/bin/tmux-cht/commands | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

if grep -qs "$selected" ~/.local/bin/tmux-cht/languages; then
    read -p "Enter Query: " query
    query=`echo $query | tr ' ' '+'`
    tmux neww sh -c "curl -s cht.sh/$selected/$query | less -r"
else
    tmux neww sh -c "curl -s cht.sh/$selected | less -r"
fi
