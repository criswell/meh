#!/bin/sh

# Logic for the monitor setup

layout_laptop_only() {
  xrandr --dpi 144x144
  bspc monitor -d I II III IV V VI VII VIII IX X
}

layout_external_all() {
  xrandr --dpi 96x96
  bspc monitor HDMI-1 -d I II III IV V VI VII VIII IX
  bspc monitor eDP-1 -d  X
}

monitors=$(xrandr | grep -sw 'connected' | cut -d " " -f 1)

unset DISPLAY_LAPTOP DISPLAY_HDMI DISPLAY_DP1 || true

for m in $monitors
do
  if [[ "$m" == "eDP-1" ]]; then
    DISPLAY_LAPTOP=yes
  elif [[ "$m" == "HDMI-1" ]]; then
    DISPLAY_HDMI=yes
  elif [[ "$m" == "DP-1" ]]; then
    DISPLAY_DP1=yes
  fi
done

if [ -n "$DISPLAY_LAPTOP" ] && [ -n "$DISPLAY_HDMI" ]; then
  layout_external_all
else
  layout_laptop_only
fi
