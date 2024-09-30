#!/bin/bash

set -e
cwd="$(dirname $0)"

version=$(pyenv versions --bare --skip-envs | cat - <(echo 'system') | fzf --prompt 'Python version: ')
name=$(echo -n | fzf --info=hidden --prompt 'Window name: ' --print-query || true)

test -z "$name" && name="$version"

"${cwd}/tmux-sessionizer.sh" -n "$name" -c "$SHELL" -a "pyenv shell ${version}" -a 'clear'
