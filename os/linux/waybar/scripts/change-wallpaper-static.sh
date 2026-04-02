#!/bin/bash

MODES=("dark" "light")
MODE="${MODES[RANDOM % ${#MODES[@]}]}"

WALLPAPER_BASE="$HOME/.config/hypr/wallpapers"
WAYBAR_DIR="$HOME/.config/waybar"

if [[ "$MODE" != "dark" && "$MODE" != "light" ]]; then
    exit 1
fi

WALLPAPER_DIR="$WALLPAPER_BASE/$MODE"

if [[ ! -d "$WALLPAPER_DIR" ]]; then
    exit 1
fi

WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

awww img -t any "$WALLPAPER" &

rm "$WAYBAR_DIR/style.css"
cp "$WAYBAR_DIR/styles/$MODE-style.css" "$WAYBAR_DIR/style.css"

pkill waybar
waybar &

WALLPAPER_NAME_NO_EXT=$(basename "$WALLPAPER" | cut -d '.' -f 1)
notify-send -t 1200 "Mode: $MODE" "Wallpaper updated to $WALLPAPER_NAME_NO_EXT"
