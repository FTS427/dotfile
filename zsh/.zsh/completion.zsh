#!/bin/zsh
# Completion
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' cache-path ${HOME}/.cache/compdump
zstyle ':completion::complete:*' gain-privileges 1
zmodload zsh/complist
compinit -d ${HOME}/.cache/zsh/compdump

# rustup
. ${ZFUNC}/rustup.zsh

