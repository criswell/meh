#!/usr/bin/env zsh

for COLOR in $(seq 0 255) 
do
    for STYLE in "38;5"
    do 
        TAG="\033[${STYLE};${COLOR}m"
        STR="${STYLE};${COLOR}"
        echo -ne "${TAG}${STR}${NONE}  "
    done
    echo
done
