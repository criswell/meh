#!/bin/bash

# travel-mode-check.sh
# --------------------
# Checks the current travel mode for the laptop and reports it for consumption
# in waybar.
#
# Acceptable modes are:
#   - home
#   - travel

TMODEFILE=~/.travel_mode

TXT_HOME="🏠"
TXT_TRAVEL="🌎"
TXT_UNKNOWN="🤷"

# Check for toggle file, if it doesn't exist, create it and default to home

if ! [ -f ${TMODEFILE} ]; then
  touch ${TMODEFILE}
  echo -n "home" > ${TMODEFILE}
fi

# Check content of toggle file, returning output for waybar that indicates
# current travel mode.
TMODE=$(<${TMODEFILE})

case $TMODE in
  home)
    echo $TXT_HOME
    ;;
  travel)
    echo $TXT_TRAVEL
    ;;
  *)
    # shrug
    echo $TXT_UNKNOWN
    ;;
esac
