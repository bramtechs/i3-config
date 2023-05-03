#!/bin/sh
picom &
# megasync &
flameshot &
# discord &
xfce4-power-manager &
gnome-keyring-daemon &
# /usr/lib/pentablet/pentablet &
xrandr --output HDMI-0 --left-of DP-0 &
numlockx &
nitrogen --restore &
~/dev/offline-linux-x64/offline &
exec awesome
