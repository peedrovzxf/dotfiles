#!/bin/bash

WALLPAPER_DIR="/home/peedrovzxf/.config/hypr/wallpapers"

if [[ ! -d "$WALLPAPER_DIR" ]]; then
    exit 1
fi

WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

pkill swaybg

swaybg -i "$WALLPAPER" -m fill &
