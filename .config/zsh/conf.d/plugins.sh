#!/bin/zsh

# Setup plugins
export ZSH_PLUGIN_DIR="${ZDOTDIR}/plugins"

test -d "$ZSH_PLUGIN_DIR" || {
    echo "Creating plugin directory ${ZSH_PLUGIN_DIR}"
    mkdir "$ZSH_PLUGIN_DIR"
}

typeset -A plugins=(
    [zsh-vi-mode]='https://github.com/jeffreytse/zsh-vi-mode.git'
    [fast-syntax-highlighting]='https://github.com/zdharma-continuum/fast-syntax-highlighting'
)

for name upstream in ${(kv)plugins}; do
    location="${ZSH_PLUGIN_DIR}/${name}"
    readlink -f "$location" &>/dev/null || { echo "Invalid path: ${location}" >&2; exit 1 }

    test -d "${location}" || {
        echo "Installing ${name} to ${location} from ${upstream}"
        git clone --quiet --depth 1 "$upstream" "$location"
    }

    plug="${location}/${name}.plugin.zsh"
    test -f "$plug" && source "${plug}"
done

ZVM_NORMAL_MODE_CURSOR="$ZVM_CURSOR_BLINKING_BLOCK"
ZVM_INSERT_MODE_CURSOR="$ZVM_CURSOR_BLINKING_BEAM"
