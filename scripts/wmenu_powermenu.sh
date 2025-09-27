#!/usr/bin/env bash
. "${HOME}/.scripts/color.sh"

uptime=$(uptime -p | sed -e 's/up //g')

wmenu_command="${HOME}/.scripts/wmenu_themed.sh -p \"$uptime\""

shutdown="󰐥 shutdown"
reboot="󰑓 reboot"
suspend="󰤄 sleep"
logout="󰍃 logout"
lockscreen="󰌾 lockscreen"

open_menu() {
    options="$lockscreen\n$suspend\n$logout\n$reboot\n$shutdown"
    chosen="$(echo -e "$options" | eval $wmenu_command)"

    case "$chosen" in
        "$shutdown")
            systemctl poweroff
            ;;
        "$reboot")
            systemctl reboot
            ;;
        "$suspend")
            rmpc pause 2>/dev/null || true
            amixer sset Master mute 2>/dev/null || true
            systemctl suspend
            swaylock
            ;;
        "$logout")
            riverctl exit
            ;;
        "$lockscreen")
            swaylock
            ;;
        *)
            exit 0
            ;;
    esac
}

if ! pidof wmenu >/dev/null && ! pidof wmenu-run >/dev/null; then
    open_menu
else
    pkill wmenu
    pkill wmenu-run
    open_menu
fi
