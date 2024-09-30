#!/bin/bash

set -e
IFS=$'\n\t'

battery_dir=/sys/class/power_supply/BAT0
capacity_file="${battery_dir}/capacity"
status_file="${battery_dir}/status"

test -d "$battery_dir" || {
    echo "Cant open ${battery_dir}: No such file" >&2 && exit 1
}

capacity=$(cat "$capacity_file")
status=$(cat "$status_file")

case "$status" in
    'Charging') indicator='+';;
    'Discharging') indicator='-';;
    'Full') indicator='*';;
    *) indicator='';;
esac

printf '%s%%%s' "$capacity" "$indicator"
