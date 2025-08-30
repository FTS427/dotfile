#!/bin/zsh
# Key bindins
bindkey -e
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "^[C" clear-screen
bindkey "\t" expand-or-complete-prefix
