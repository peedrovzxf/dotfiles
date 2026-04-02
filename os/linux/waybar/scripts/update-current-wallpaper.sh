STATE_FILE="/tmp/awww_pause_state"
PAUSE_CMD="/home/peedrovzxf/.dotfiles/os/linux/waybar/scripts/change-wallpaper-static.sh"
RESUME_CMD="/home/peedrovzxf/.dotfiles/os/linux/waybar/scripts/change-wallpaper-animated.sh"
current_state() {
  [[ -f "$STATE_FILE" ]] && cat "$STATE_FILE" || echo "resumed"
}

if [[ "$(current_state)" == "paused" ]]; then
  $PAUSE_CMD
else
  $RESUME_CMD
fi


