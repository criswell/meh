#!/bin/sh

source /home/sam/.config/bspwm/monitor_settings.sh

# Logic for the window setup

bspc config border_width         1
bspc config window_gap           3

bspc config split_ratio          0.52
bspc config borderless_monocle   true
bspc config gapless_monocle      true
bspc config top_padding 25

if [ -n "$DISPLAY_DP2" ]; then
  bspc config -m DP-2 top_padding 3
fi
