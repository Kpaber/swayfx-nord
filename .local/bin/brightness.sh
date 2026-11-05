#!/usr/bin/env bash
brightnessctl set "$1" -q

BRI=$(brightnessctl -m | awk -F'[,%]' '{print $4}')

dunstify -h string:x-dunst-stack-tag:brightness -t 1500 -i display-brightness "Яркость: ${BRI}%" -h int:value:"$BRI"
