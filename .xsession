#!/bin/sh
picom &
megasync &
flameshot &
discord &
xfce4-power-manager &
gnome-keyring-daemon &
nitrogen --restore &
xrandr --output HDMI-A-0 --left-of DisplayPort-0 &
exec awesome
