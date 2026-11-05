#!/usr/bin/env bash
case "$1" in
    up)     wpctl set-volume -l 1.52 @DEFAULT_AUDIO_SINK@ 2%+ ;;
    down)     wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%- ;;
    toggle) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
esac

STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

VOL=$(awk '{printf "%d", $2 * 100}' <<< "$STATUS")

BAR_VAL=$(awk -v v="$VOL" '{printf "%d", (v / 152) * 100}' <<< "$STATUS")
[ "$BAR_VAL" -gt 100 ] && BAR_VAL=100

if grep -q "MUTED" <<< "$STATUS"; then
    dunstify -h string:x-dunst-stack-tag:volume -t 1500 -i audio-volume-muted "Громкость" "Без звука" #-h int:value:0
else
    dunstify -h string:x-dunst-stack-tag:volume -t 1500 -i audio-volume-high "Громкость: ${VOL}%" -h int:value:"$BAR_VAL"
fi
