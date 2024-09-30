#!/bin/sh

target=$(tmux display-message -p "#S:#P")
bufferDir="${HOME}/.cache/savedbuff"
bufferFile="./tmux_${target}.log"

tmux capture-pane -pJS - > "${bufferFile}"
tmux display-message -d 2000 "Captured pane to ${bufferFile}"
