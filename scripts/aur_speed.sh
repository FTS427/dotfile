#!/usr/bin/env bash

set -euo pipefail

declare -A MIRRORS=(
    ["github.com"]="https://ghproxy.net/https://github.com/"
    ["downloads.sourceforge.net"]="https://liquidtelecom.dl.sourceforge.net/"
)

output_file="$1"
url="$2"

domain=$(echo "$url" | awk -F[/:] '{print $4}')
path=$(echo "$url" | cut -d'/' -f4-)

ARIA2C_OPTS=(
    --conf-path=/home/fts427/.config/aria2/pacman_aria.conf
)

download() {
    local dl_url="$1"
    /usr/bin/aria2c "${ARIA2C_OPTS[@]}" "$dl_url" -o "$output_file"
}

if [[ -n "${MIRRORS[$domain]:-}" ]]; then
    download "${MIRRORS[$domain]}$path"
else
    download "$url"
fi
