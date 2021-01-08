#Load/source colors
autoload -U colors && colors
source $XDG_CACHE_HOME/wal/colors-tty.sh
setopt PROMPT_SUBST

#Default programs
export PATH=$HOME/.local/scripts:$PATH
export EDITOR="nvim"
export BROWSER="firefox"
export READER="zathura"

#Defaults
#export TERM=rxvt-unicode-256color

#History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$XDG_CACHE_HOME/zsh/history

#Autocd and don't freeze term with C-s
setopt autocd
stty stop undef

#Autocomplete aliases
setopt complete_aliases

#Source aliases
source $ZDOTDIR/aliases

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#Vim mode
source $ZDOTDIR/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh 2>/dev/null
source $ZDOTDIR/plugins/zsh-vim-mode/zvm-settings.zsh
#Source prompt
#Must be sourced after zsh-vim-mode if
#mode vim mode indicator is set in RPS1
source $ZDOTDIR/zprompt

#Plugins
source $ZDOTDIR/plugins/colored-man-pages.plugin.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
