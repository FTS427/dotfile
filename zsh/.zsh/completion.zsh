#!/bin/zsh
# Completion
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' cache-path ${ZFILE}/compdump
zmodload zsh/complist
compinit -d ${ZFILE}/compdump

# rustup
. ${ZFUNC}/rustup.zsh
