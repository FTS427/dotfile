# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=999999999
SAVEHIST=999999999

# Beep
setopt beep
bindkey -e
zstyle :compinstall filename '/home/fts427/.zshrc'
# Plug
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/incr/incr.plugin.zsh

# Alias
alias system='neofetch|lolcat'
alias ls='lsd'
alias la='lsd -a'
alias ll='lsd -l'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias upgrub="sudo update-grub"
alias fastgh="sudo fastgithub start"
alias reboot='sudo reboot'
alias shutdown='sudo shutdown now'
alias qq='linuxqq'

alias unxz='tar -xf'
alias untgz='tar -zxvf'

# Key Map
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
# rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

# Git
autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

# Prompt
PROMPT='%B%F{cyan}[%n]%f@%F{blue}[%m]%F{green}[%1~]%f%b> '
RPROMPT='%B%F{yellow}['\$vcs_info_msg_0_']%f%F{white}[%*][%D]%f%b'

# Color
if [ -n $DISPLAY ];
    then export TERM="xterm-256color"
    else export TERM="linux"
fi

