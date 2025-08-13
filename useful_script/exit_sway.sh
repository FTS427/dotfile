#!/usr/bin/env sh
swaynag -t warning -m \
	'You pressed the exit shortcut. Do you really want to exit sway?' \
	-B 'Yes, exit sway.' 'swaymsg exit'
