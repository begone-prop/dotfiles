#!/bin/zsh

#XDG, cleans up ~/
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export GOPATH="$XDG_DATA_HOME/go"
export HISTFILE="$XDG_DATA_HOME/history"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export LESSHISTFILE=-
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export NVM_DIR="$XDG_DATA_HOME"/nvm
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export KDEHOME="$XDG_CONFIG_HOME"/kde
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
#export GNUPGHOME="$XDG_DATA_HOME"/gnupg

export PAGER="/usr/bin/slit"
export MANPAGER="nvim -c 'set ft=man' -"

export PRIMARY_COLOR="#1d2aff"

#Scripts to run at login
$HOME/.local/bin/blight l
