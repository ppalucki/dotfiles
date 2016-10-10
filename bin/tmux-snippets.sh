#!/bin/bash

if [ -z "$1" -o -z "$2" ];
then
    TMUX_WINDOW=$(tmux list-window | awk '/(active)/{print $(NF-1)}')
    TMPFILE=$(mktemp /tmp/.tmux-snippets.XXXX)

    tmux new-window -n "snippets" "cat $HOME/dotfiles/tmuxsnippets $HOME/.tmuxsnippets_local| grep -Ev '^(#|$)' | peco --rcfile $HOME/dotfiles/.peco/config.json --layout bottom-up > $TMPFILE;$0 $TMUX_WINDOW $TMPFILE"
else
    tmux send-key -t $1 "$(cat $2)"
    rm -f $2
fi
