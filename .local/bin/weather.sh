#!/usr/bin/env bash

# Для панели: иконка + температура
text=$(curl -sf --connect-timeout 3 --max-time 8 "http://wttr.in/?format=%c%t") || text="N/A"

# Для tooltip: подробный текстовый блок
# \n — это перенос строки, который Pango понимает
tooltip=$(curl -sf --connect-timeout 3 --max-time 8 "http://wttr.in/?format=%l+\n%C\nВлажность:+%h\nВетер:+%w\nДавление:+%P\n&lang=ru") || tooltip="Погода недоступна"

# Экранируем переносы строк для JSON
tooltip=$(echo "$tooltip" | sed ':a;N;$!ba;s/\n/\\n/g')

echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
