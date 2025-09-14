#!/usr/bin/sh

MENU="${HOME}/.scripts/wmenu_themed.sh -p 📋 -l 6"

EMOJI_CACHE="${HOME}/.cache/emoji_cache.txt"
EMOJI_REMOTE="https://unicode.org/Public/emoji/latest/emoji-test.txt"

[ -f "$EMOJI_CACHE" ] || curl "$EMOJI_REMOTE" > "$EMOJI_CACHE"

cut -d'#' -f2- "$EMOJI_CACHE" | tail -n +33 | head -n -11 | grep -v '^$' | $MENU | cut -d' ' -f2 | wl-copy -n
