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
. ${ZFILE}/sk_key_bindings.zsh
. ${ZFILE}/completion.zsh
. ${HOME}/.scripts/color.sh

setopt beep
zstyle :compinstall filename '${HOME}/.zshrc'

# Plugins
. ${ZPLUG_SYS}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. ${ZPLUG_SYS}/zsh-autosuggestions/zsh-autosuggestions.zsh
. ${ZPLUG_SYS}/zsh-history-substring-search/zsh-history-substring-search.zsh

# DE
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then 
  env $(cat ${HOME}/.config/environment.d/riverenv.conf | sed ':a;N;$!ba;s/\n/ /g') river
fi

# Func
. ${ZFUNC}/ccache.zsh
. ${ZFUNC}/copypath.zsh
. ${ZFUNC}/sk.zsh

# Skim

export SKIM_DEFAULT_OPTIONS="--color=fg:#${nord6},bg:#${nord0},matched:#${nord4},matched_bg:#${nord3},current:#${nord6},current_bg:#${nord2},current_match:#${nord5},current_match_bg:#${nord2},spinner:#${nord10},info:#${nord14},prompt:#${nord7},cursor:#${nord7},selected:#${nord8},header:#${nord3},border:#${nord8} \
                      --no-clear-start \
                      --layout reverse \
                      --height 20% \
                      --cmd-prompt \$\>"

