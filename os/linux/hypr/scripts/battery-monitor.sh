#!/bin/bash

NOTIFIED_LOW=0
NOTIFIED_CRITICAL=0

while true; do
    BATTERY_CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity)
    BATTERY_STATUS=$(cat /sys/class/power_supply/BAT1/status)

    if [ "$BATTERY_STATUS" = "Discharging" ]; then
        if [ "$BATTERY_CAPACITY" -le 20 ] && [ "$BATTERY_CAPACITY" -gt 5 ]; then
            if [ "$NOTIFIED_LOW" -eq 0 ]; then
                notify-send -u critical "BATTERY LOW"
                NOTIFIED_LOW=1
                NOTIFIED_CRITICAL=0
            fi
        elif [ "$BATTERY_CAPACITY" -le 5 ]; then
            if [ "$NOTIFIED_CRITICAL" -eq 0 ]; then
                notify-send -u critical "BATTERY CRITICAL - 5% LEFT"
                NOTIFIED_CRITICAL=1
                NOTIFIED_LOW=1
            fi
        fi
    else

        NOTIFIED_LOW=0
        NOTIFIED_CRITICAL=0
    fi

    sleep 60
done

