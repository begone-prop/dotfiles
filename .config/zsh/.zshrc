#!/bin/zsh

# TODO:
# + util scripts in profile (add_path, ...)
# + shell agnostic as possible

autoload -Uz colors zsh/terminfo && colors
autoload -Uz promptinit && promptinit

# History

setopt INC_APPEND_HISTORY
# setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

SAVEHIST=10000
HISTSIZE=$SAVEHIST
export HISTFILE="${ZDOTDIR}/history"

setopt autocd
stty stop undef

setopt complete_aliases

zmodload zsh/complist
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select
zstyle :compinstall filename "${ZDOTDIR}/.zshrc"

zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

_comp_options+=(globdots)

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b'
precmd() { vcs_info }

setopt PROMPT_SUBST
# PROMPT='%n@%M %c %B->%f '
PROMPT='%B%F{#5e81ac}%n%F{#b48ead}@%F{#a3be8c}%M %F{#d08770}%c %F{#5e81ac}-> %f'
RPROMPT='%F{#d08770}${vcs_info_msg_0_}%f'

# Source additinal configurations
ZSH_CONF_DIR="${ZDOTDIR}/conf.d"
readlink -f "$ZSH_CONF_DIR" &>/dev/null || { echo "Invalid path: ${ZSH_CONF_DIR}" >&2; exit 1 }
test -d "$ZSH_CONF_DIR" || mkdir "$ZSH_CONF_DIR"

find -H "$ZSH_CONF_DIR" -name '*.sh' -executable -type f \
    | while read -r conf_script; do source "$conf_script"; done

if tmux has-session; then
    test -z "$TMUX" && tmux attach
else
    tmux new -s '#h' -n 'local'
fi
