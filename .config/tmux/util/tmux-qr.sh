#!/bin/bash

set -e

tmux lsb \
    | fzf \
        --no-sort \
        --delimiter : \
        --preview-window 'top,75%' \
        --preview 'tmux showb -b {1} | qrencode -t ansiutf8' \
    | grep -Po '^[^:]+' \
    | xargs -r tmux showb -b
