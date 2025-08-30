#!/bin/zsh
autoload -Uz vcs_info
autoload -Uz colors && colors
setopt prompt_subst

# Configure vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' !'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats '%F{yellow}[%b%u%c]%f'
zstyle ':vcs_info:git:*' actionformats '%F{yellow}[%b|%a%u%c]%f'

precmd() { 
    vcs_info
}

if [ ! $UID -eq 0 ]; then
    if [ -n "$SSH_CONNECTION" ]; then
        export PROMPT=$'%B%F{cyan}[%n]%f@%F{blue}[%m ssh]%F{green}[%1~]%f%b%F{white}$%f '
    else
        export PROMPT=$'%B%F{cyan}[%n]%f@%F{blue}[%m]%F{green}[%1~]%f%b%F{white}$%f '
    fi
else
    export PROMPT='%B%F{red}[%n]%f@%F{blue}[%m]%F{green}[%1~]%f%b%F{white}#%f '
fi

export RPROMPT='${vcs_info_msg_0_}%F{white}[%*][%D]%f'

