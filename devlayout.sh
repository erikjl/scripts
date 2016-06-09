#!/bin/sh

# Resize terminal [35 rows 120 columns]
echo -e "\e[8;35;120t"

tmux new-session -d "vim"
#tmux send-keys "vim" C-m
tmux send-keys ":NERDTree" C-m
#tmux select-window -t foo:0
tmux split-window -v  #vim goes top, this new goes bottom
#make bottom pane smallei
tmux resize-pane -D 5
tmux split-window -h
tmux select-pane -t 0
tmux -2 attach-session -d
