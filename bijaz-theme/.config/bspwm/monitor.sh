#!/bin/sh

source /home/sam/.config/bspwm/monitor_settings.sh

# Logic for the monitor setup

layout_laptop_only() {
  xrandr --dpi 144x144
  bspc monitor -d I II III IV V VI VII VIII IX X
}

layout_external_hdmi_only() {
  #xrandr --output HDMI-1 --mode 3840x1200 --pos 0x0 --primary
  #xrandr --output eDP-1 --mode 2560x1440 --pos 2560x0
  xrandr --dpi 96x96
  bspc monitor HDMI-1 -d I II III IV V VI VII VIII XI
  bspc monitor eDP-1 -d  X
}

layout_external_all() {
  #xrandr --output HDMI-1 --mode 2560x1080 --pos 0x0 --primary
  #xrandr --output HDMI-1 --mode 3840x1200 --pos 0x0 --primary
  #xrandr --output eDP-1 --mode 2560x1440 --pos 2560x0
  xrandr --dpi 96x96
  bspc monitor DP-2 -d I
  bspc monitor HDMI-1 -d II III IV V VI VII VIII IX
  bspc monitor eDP-1 -d  X
}

if [ -n "$DISPLAY_LAPTOP" ] && [ -n "$DISPLAY_HDMI" ] && [ -n "$DISPLAY_DP2" ]; then
  layout_external_all
elif [ -n "$DISPLAY_LAPTOP" ] && [ -n "$DISPLAY_HDMI" ]; then
  layout_external_hdmi_only
else
  layout_laptop_only
fi
