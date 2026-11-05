#!/usr/bin/env bash

if pgrep -x "gammastep" > /dev/null; then
    pkill gammastep
    notify-send 'Защита глаз' Выкл
else
    gammastep -O 4000 &
    notify-send 'Защита глаз' Вкл
fi
