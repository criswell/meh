#!/bin/bash

# Sets up Alia stuff, tries to not repeat things that already are working

#-----------
# Constants
#-----------

TOOLING_DIR=~/.config/alia-custom

echo "Attempting to setup Alia..."

#------
# Init
#------

if [ ! -d ${TOOLING_DIR} ]; then
  echo "> Creating alia-custom"
  mkdir -p ${TOOLING_DIR}
fi

#------------
# Rofi items
#------------

# rofi-wifi-menu

if [ ! -d ${TOOLING_DIR}/rofi-wifi-menu ]; then
  pushd ${TOOLING_DIR}
  echo "> Cloning rofi-wifi-menu"
  git clone https://github.com/ericmurphyxyz/rofi-wifi-menu.git
  popd
else
  pushd ${TOOLING_DIR}/rofi-wifi-menu
  echo "> Updating rofi-wifi-menu"
  git fetch --all
  git reset --hard origin/master
  popd
fi
