#!/bin/sh
intern=eDP-1
extern=HDMI-1
img=0134.jpg
 
if xrandr | grep "$extern disconnected"; then
  xrandr --output "$extern" --off --output "$intern" --auto &&
  feh --bg-fill ~/Pictures/wallpapers/"$img"
else 
  xrandr --output "$intern" --off --output "$extern" --auto &&
  xcalib ~/.config/hp-x27q-calibration.icm &&
  feh --bg-fill ~/Pictures/wallpapers/"$img"
fi
