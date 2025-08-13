#!/usr/bin/env bash

## Copyright (C) 2020-2023 Aditya Shakya <adi1090x@gmail.com>
##
## Wofi Powermenu

## Files
CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/style.css"

## Wofi Command
wofi_command="wofi --show dmenu \
			--conf ${CONFIG} --style ${STYLE} \
			--width=300 --height=200 \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--define=matching=fuzzy"

uptime=$(uptime -p | sed -e 's/up //g')

## Entries
shutdown="󰐥 shutdown"
reboot="󰑓 reboot"
suspend="󰤄 sleep"
logout="󰍃 logout"
lockscreen="󰌾 lockscreen"

# Variable passed to rofi
open_menu () {
	options="$lockscreen\n$suspend\n$logout\n$reboot\n$shutdown"

	chosen="$(echo -e "$options" | $wofi_command --prompt "$uptime")"
	case $chosen in
		$shutdown)
			if [[ "$?" == 0 ]]; then
				systemctl poweroff
			else
				exit
			fi
			;;
		$reboot)
			if [[ "$?" == 0 ]]; then
				systemctl reboot
			else
				exit
			fi
			;;
		$suspend)
			if [[ "$?" == 0 ]]; then
				rmpc pause
				pulsemixer --mute
				systemctl suspend
                hyprlock
			else
				exit
			fi
			;;
		$logout)
			if [[ "$?" == 0 ]]; then
				hyprctl exit
			else
				exit
			fi
			;;
        $lockscreen)
            if [[ "$?" == 0 ]]; then
                hyprlock
            else
                exit
            fi
            ;;
	esac
}

if [[ ! `pidof wofi` ]]; then
	open_menu
else
	pkill wofi
	open_menu
fi
