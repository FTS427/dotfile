#!/usr/bin/env sh
source "$HOME/.scripts/color.sh"
echo '{"version": 1, "click_events": false}'
echo '['

first=1
while true
do
    blocks=""

    # 获取当前活动窗口标题
    window_title=$(swaymsg -t get_tree | jq -r '.. | select(.focused? == true) | .name' | head -n1)
    window_block="{\"full_text\":\"$window_title\",\"color\":\"$nord6\",\"background\":\"$nord0\"}"

    # 检测 eno1 的 IPv4 地址
    ipaddr=$(ip -4 addr show eno1 | awk '/inet / {print $2}' | cut -d '/' -f1 | head -n1)
    if [ -n "$ipaddr" ]; then
        network_block="{\"name\":\"network\",\"full_text\":\"󰩠 $ipaddr\",\"color\":\"$nord12\",\"background\":\"$nord0\"}"
    else
        network_block="{\"name\":\"network\",\"full_text\":\"󰱟 Disconnected\",\"color\":\"$nord12\",\"background\":\"$nord0\"}"
    fi

    # 音量信息
    volume=$(amixer get Master | grep '%' | tail -n1 | awk '{print $5}' | tr -d '[]%')
    mute=$(amixer get Master | grep '%' | tail -n1 | awk '{print $6}')
    if [ "$mute" = "[off]" ]; then
        volume_block="{\"name\":\"volume\",\"full_text\":\"󰝟 Muted\",\"color\":\"$nord11\",\"background\":\"$nord0\"}"
    else
        volume_block="{\"name\":\"volume\",\"full_text\":\"󰕾 $volume%\",\"color\":\"$nord13\",\"background\":\"$nord0\"}"
    fi

    # 时间
    time_block=$(date +"%H:%M" | awk -v fg="$nord15" -v bg="$nord0" '{printf "{\"name\":\"clock\",\"full_text\":\"󰥔 %s\",\"color\":\"%s\",\"background\":\"%s\"}", $0, fg, bg}')

    # 组合
    blocks="[$window_block,$volume_block,$network_block,$time_block]"

    if [ $first -eq 1 ]; then
        echo "$blocks"
        first=0
    else
        echo ",$blocks"
    fi

    sleep 1
done
