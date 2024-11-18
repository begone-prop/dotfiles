export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"

export EDITOR="nvim"
export PATH="${HOME}/.local/bin:${PATH}"

export DOTFILES_BARE_REPO="${HOME}/repos/dotfiles"

#Clean up
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export LESSHISTFILE="-"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java"
export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"

export MANPAGER='nvim +Man!'
