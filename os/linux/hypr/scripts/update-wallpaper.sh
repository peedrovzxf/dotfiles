#!/bin/zsh

STATE_FILE="/tmp/awww_pause_state"
PAUSE_CMD="/home/peedrovzxf/.dotfiles/os/linux/waybar/scripts/change-wallpaper-static.sh"
RESUME_CMD="/home/peedrovzxf/.dotfiles/os/linux/waybar/scripts/change-wallpaper-animated.sh"
current_state() {
  [[ -f "$STATE_FILE" ]] && cat "$STATE_FILE" || echo "resumed"
}

set_state() {
  echo "$1" > "$STATE_FILE"
}

do_pause() {
  if [[ "$(current_state)" != "paused" ]]; then
    $PAUSE_CMD
    set_state "paused"
  fi
}

do_resume() {
  if [[ "$(current_state)" != "resumed" ]]; then
    $RESUME_CMD
    set_state "resumed"
  fi
}

toggle_wallpaper() {
  if [[ "$(current_state)" == "resumed" ]]; then
    do_pause
  else
    do_resume
  fi
}

toggle_wallpaper
