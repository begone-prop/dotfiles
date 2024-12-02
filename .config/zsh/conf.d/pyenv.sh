#!/bin/sh

# Setup pyenv

PYENV_UPSTREAM='https://github.com/pyenv/pyenv.git'

shell=zsh

# export PYENV_ROOT="${HOME}/.pyenv"
export PYENV_ROOT="${HOME}/.pyenv"
test -d "${PYENV_ROOT}/bin" || {
    echo "Installing pyenv to ${PYENV_ROOT} from ${PYENV_UPSTREAM}"
    curl -s 'https://pyenv.run' | bash
}

test -d "${PYENV_ROOT}/bin" && export PATH="${PYENV_ROOT}/bin:${PATH}"

eval "$(pyenv init - $shell)"
eval "$(pyenv virtualenv-init - $shell)"
