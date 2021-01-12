#!/bin/bash
tmux new-session -d
tmux split-w
tmux select-pane -U
tmux split-window -h
tmux send-keys -t right 'watch -n 1 date' C-m
tmux select-pane -D
tmux send-keys -t top-left 'htop' C-m
tmux send-keys -t bottom 'sudo tcpdump -v -n "dst host 192.168.1.1 and(dst port 80 or dst port 443)"' C-m
tmux attach

