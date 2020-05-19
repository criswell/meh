# Logic to set what monitors are present

monitors=$(xrandr | grep -sw 'connected' | cut -d " " -f 1)

unset DISPLAY_LAPTOP DISPLAY_HDMI DISPLAY_DP2 || true

for m in $monitors
do
  if [[ "$m" == "eDP-1" ]]; then
    DISPLAY_LAPTOP=yes
  elif [[ "$m" == "HDMI-1" ]]; then
    DISPLAY_HDMI=yes
  elif [[ "$m" == "DP-2" ]]; then
    DISPLAY_DP2=yes
  fi
done
