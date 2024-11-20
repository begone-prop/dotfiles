#!/bin/bash

set -eo pipefail

tmux lsp -aF '#D:#S:#W:#P' \
    | fzf \
        --preview-window 'top,75%' \
        --preview 'e={}; tmux capture -pt ${e%%:*}' \
        --bind 'enter:become(e={}; tmux capture -S - -pt ${e%%:*} | $EDITOR)' \
