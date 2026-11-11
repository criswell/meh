#!/bin/bash

# travel-mode-toggle.sh
# ---------------------
# Toggles the travel mode. Will cycle through the various modes.
#
# Acceptable modes are:
#   - home
#   - travel

TMODEFILE=~/.travel_mode

# Check for toggle file, if it doesn't exist, create it and default to home

if ! [ -f ${TMODEFILE} ]; then
  touch ${TMODEFILE}
  echo -n "home" > ${TMODEFILE}
fi

# Read mode, advance it
TMODE=$(<${TMODEFILE})

case $TMODE in
  home)
    echo -n "travel" > ${TMODEFILE}
    notify-send -t 5000 "Travel Toggle" "Switch to 'travel' queued."
    ;;
  travel)
    echo -n "home" > ${TMODEFILE}
    notify-send -t 5000 "Travel Toggle" "Switch to 'home' queued."
    ;;
  *)
    # Alert the user
    notify-send "Travel Toggle Error" "Was unable to toggle travel mode. Existing travel mode file contains unkown data."
    ;;
esac
