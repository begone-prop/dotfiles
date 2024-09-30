#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

gen_window_name() {
    session_name=$(tmux display-message -p "#S")
    name=$(echo "${1:-}" | tr '.:' '_')
    target="${session_name}:${name}"

    tmux has-session -t "$target" 2>/dev/null && {
        count=$(
            tmux list-windows -t arch -F '#W' \
                | grep -Po "${name}(_\d+)?" \
                | sort -n \
                | tail -n 1 \
                | sed -r "s/^${name}_?//g"
        )

        test -z "$count" && count=0

        count=$((count + 1))
        name="${name}_${count}"
    }

    echo "${session_name}:${name}"
}

name=''
after_action=()
delay=0
switch_delay=$delay
background=0

while getopts "n:c:a:d:b" carg; do
    case "$carg" in
        n) name=$OPTARG;;
        c) action=$OPTARG;;
        a) after_action+=("$OPTARG");;
        d) delay=$(echo "$OPTARG" | awk -F ',' '{print $1}')
            switch_delay=$(echo "$OPTARG" | awk -F ',' '{print $2}')
            switch_delay=${switch_delay:-$delay};;
        b) background=1;;
        *) exit 1;;
    esac
done

test -z "$name" || test -z "$action" && exit 1

target=$(gen_window_name "$name")
tmux neww -dn "${target##*:}" "$action"

if [ "$background" -lt 1 ]; then
    (sleep "$switch_delay" && tmux switch -t "$target") &
fi

for aftcmd in "${after_action[@]}"; do
    sleep "$delay" && tmux send-keys -t "$target" "$aftcmd"
done
