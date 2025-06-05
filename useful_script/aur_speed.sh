#!/usr/bin/env bash

set -euo pipefail

declare -A MIRRORS=(
    ["github.com"]="https://ghproxy.net/https://github.com/"
    ["gitlab.com"]="https://gitlab.com/"
    ["bitbucket.org"]="https://bitbucket.org/"
)

output_file="$1"
url="$2"

domain=$(echo "$url" | awk -F[/:] '{print $4}')
path=$(echo "$url" | cut -d'/' -f4-)

download() {
    local dl_url="$1"
    /usr/bin/aria2c --conf-path=/home/fts427/.config/aria2/pacman_aria.conf "$dl_url" -o "$output_file"
}

if [[ -n "${MIRRORS[$domain]:-}" ]]; then
    download "${MIRRORS[$domain]}$path"
else
    download "$url"
fi
