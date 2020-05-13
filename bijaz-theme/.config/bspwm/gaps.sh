#!/bin/sh

window_gap="bspc config window_gap"

case "$1" in

        plus) "$($window_gap $((`$window_gap` + 2 )))"
                gapsize=`$window_gap`
                notify-send "Gap : " "$gapsize" --urgency=low --expire-time=500 ;;

        minus) if [ `$window_gap` -ne 0 ]; then
                "$($window_gap $((`$window_gap` - 2 )))"
                gapsize=`$window_gap`
                notify-send "Gap : " "$gapsize" --urgency=low --expire-time=500
                fi ;;

        equal) "$($window_gap 3)" ;;
esac
