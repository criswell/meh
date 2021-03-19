#! /bin/sh

# Various KDE things, currently ripped from
#   https://www.reddit.com/r/bspwm/comments/j80wqg/plasma_notifications_menu_appearing_as_a_window/
# Probably will want to re-evaluate all this since I'm not 100% what it all
# does.

bspc rule -a krunner state=floating sticky=off border=off layer=below
bspc rule -a lattedock sticky=off border=off state=floating
# THIS IS THE ONE THAT WORKS... I'm not sure the others are needed
bspc rule -a plasmashell state=floating sticky=off border=off center=off
bspc rule -a plasma state=floating border=off layer=below center=off
bspc rule -a plasma-desktop state=floating border=off layer=below center=off
