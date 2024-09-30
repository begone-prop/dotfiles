autoload -Uz colors zsh/terminfo && colors
autoload -Uz promptinit && promptinit

# History

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="${XDG_CACHE_HOME}/zsh/history"

setopt autocd
stty stop undef

setopt complete_aliases

## Basic auto/tab complete:
zmodload zsh/complist
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select
zstyle :compinstall filename "${ZDOTDIR}/.zshrc"

zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

_comp_options+=(globdots)

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

source "${ZDOTDIR}/aliases.sh"

# Plugins
source "${ZDOTDIR}/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
source "${ZDOTDIR}/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

ZVM_NORMAL_MODE_CURSOR="$ZVM_CURSOR_BLINKING_BLOCK"
ZVM_INSERT_MODE_CURSOR="$ZVM_CURSOR_BLINKING_BEAM"

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:git*' formats '%b'
precmd() { vcs_info }

setopt PROMPT_SUBST
PROMPT='%n@%M %c %B->%f '
RPROMPT='${vcs_info_msg_0_}'

if tmux has-session; then
    test -z "$TMUX" && tmux attach
else
    tmux new -s def -n "$HOST"
fi
