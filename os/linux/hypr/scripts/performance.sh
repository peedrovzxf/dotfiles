#!/usr/bin/env sh

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

if [ "$HYPRGAMEMODE" == 1 ]; then
  notify-send "Hyprland" "Performance mode enabled!"

  hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:enabled 0;\
        keyword decoration:rounding 0"
  
  # Thanks to https://github.com/ry-diffusion/dotfiles/blob/c7ff0d6129877af5c3ddad4c644b0d28a351d7b4/confs/hypr/Binary/hypr.PerformanceMode
  exit
fi

notify-send "Hyprland" "Performance mode disabled!"
hyprctl reload

