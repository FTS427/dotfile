#!/usr/bin/zsh
# Z shell Config

case $- in # check shell options
    *i*) ;; # interactive shell
      *) return;; # don't do anything
esac

. "${ZFILE}/prompt.zsh"
. "${ZFILE}/hist.zsh"
. "${ZFILE}/alias.zsh"
. "${ZFILE}/key_bindings.zsh"
. "${ZFILE}/sk_key_bindings.zsh"
. "${ZFILE}/completion.zsh"
. ~/.scripts/color.sh

setopt beep
zstyle :compinstall filename '~/.zshrc'

# Plugins
. "${ZPLUG_SYS}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
. "${ZPLUG_SYS}/zsh-autosuggestions/zsh-autosuggestions.zsh"
. "${ZPLUG_SYS}/zsh-history-substring-search/zsh-history-substring-search.zsh"

# DE
if [ -z "$WAYLAND_DISPLAY" ] && [ $(tty) = "/dev/tty1" ]; then 
  ~/.scripts/choose_de.zsh
fi

# Func
. "${ZFUNC}/ccache.zsh"
. "${ZFUNC}/copypath.zsh"
. "${ZFUNC}/sk.zsh"

# Skim

export SKIM_DEFAULT_OPTIONS="--color=fg:#${nord6},bg:#${nord0},matched:#${nord4},matched_bg:#${nord3},current:#${nord6},current_bg:#${nord2},current_match:#${nord5},current_match_bg:#${nord2},spinner:#${nord10},info:#${nord14},prompt:#${nord7},cursor:#${nord7},selected:#${nord8},header:#${nord3},border:#${nord8} \
                      --no-clear-start \
                      --layout reverse \
                      --height 20% \
                      --cmd-prompt \$\> \
                      --ansi -i -c 'rg --color=always --line-number \"{}\"'"

