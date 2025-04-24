#!/bin/bash

set -euo pipefail

grep -P '^Host(?!\s*\*)' ~/.ssh/config \
    | awk '{print $2}' \
    | fzf \
        --prompt '$ ' \
        --tmux center,50%,75%,border-native \
        --preview-window 'top,75%' \
        --preview "grep -Poz '(?s)Host {}\n.*?(?=(\nHost|$))' ~/.ssh/config | tr -d '\0' | tee >(grep -w IdentityFile | awk '{print \$2}' | xargs -rI {} sh -c 'ssh-keygen -lvf {}') >(bat --color=always -pl ssh_config; echo) >/dev/null" \
        --bind 'enter:become(tmux neww -n {} ssh {})' \
        --bind 'ctrl-v:become(tmux splitw -h ssh {})' \
        --bind 'ctrl-h:become(tmux splitw -v ssh {})'
