#!/usr/bin/zsh
# Z shell Config

case $- in # check shell options
    *i*) ;; # interactive shell
      *) return;; # don't do anything
esac

. ${HOME}/.zsh/path_env.zsh

. ${ZFILE}/prompt.zsh
. ${ZFILE}/hist.zsh
. ${ZFILE}/alias.zsh
. ${ZFILE}/key_bindings.zsh
. ${ZFILE}/completion.zsh

setopt beep
zstyle :compinstall filename '${HOME}/.zshrc'

# Plugins
. ${ZPLUG_SYS}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. ${ZPLUG_SYS}/zsh-autosuggestions/zsh-autosuggestions.zsh
. ${ZPLUG_SYS}/zsh-history-substring-search/zsh-history-substring-search.zsh

# DE
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
   exec river
fi

# Func
. ${ZFUNC}/ccache.zsh
. ${ZFUNC}/copypath.zsh
