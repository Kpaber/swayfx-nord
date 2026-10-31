#!/usr/bin/env bash

LOCATION="Барнаул"

TEXT=$(curl -s --max-time 4 "http://wttr.in/${LOCATION}?format=%c+%t" 2>/dev/null)

TABLE=$(
#	curl -s --max-time 6 "http://wttr.in/${LOCATION}?format=%l\n%C+%t\nОщущается+как:%f\nСкорость+ветра:%w\nДавление:%P\nВлажность:%h\nUF-индекс:%u\n&lang=ru" 2>/dev/null
	curl -s --max-time 8 "http://wttr.in/${LOCATION}?1ATqQF&lang=ru" 2>/dev/null | tail -n +6
)


# Оборачиваем в тег <tt> для сохранения моноширинных колонок в Waybar
TOOLTIP="<tt>${TABLE}</tt>"

jq -nc \
  --arg text "$TEXT" \
  --arg tooltip "$TOOLTIP" \
  '{"text": $text, "tooltip": $tooltip}'
