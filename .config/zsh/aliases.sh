#General

alias cp="cp -i"
alias rm="rm -I"
alias mv="mv -i"
alias ls='ls --color=auto -h'
alias grep='grep --color=auto'
alias v='vim'
alias n='nvim'
alias ip='ip -c'

test -d "$DOTFILES_BARE_REPO" \
    && alias dotf="git --git-dir=${DOTFILES_BARE_REPO} --work-tree=${HOME}"
