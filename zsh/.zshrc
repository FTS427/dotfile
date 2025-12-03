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
#. "${ZPLUG_SYS}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
. "${ZPLUG_SYS}/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
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

