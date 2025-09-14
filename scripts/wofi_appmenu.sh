#!/usr/bin/env bash

CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/style.css"

open_menu () {
	wofi --show drun \
		--conf ${CONFIG} --style ${STYLE} \
		--cache-file=${HOME}/.cache/wofi-drun \
		--hide-scroll --define=matching=fuzzy
}

if [[ ! `pidof wofi` ]]; then
	open_menu
else
	pkill wofi
	open_menu
fi
