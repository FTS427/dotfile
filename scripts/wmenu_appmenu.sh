#!/usr/bin/sh
. ${HOME}/.scripts/color.sh

open_menu(){
	wmenu-run -i -f "JetBrainsMono Nerd Font 16" -o "HDMI-A-1" -p "nya~" \
        -N "$nord0" -n "$nord6" -M "$nord8" -m "$nord0" -S "$nord2" -s "$nord6"
}

if ! pidof wmenu >/dev/null && ! pidof wmenu-run >/dev/null; then
    open_menu
else
    pkill wmenu
    pkill wmenu-run
    open_menu
fi
