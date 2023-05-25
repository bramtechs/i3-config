#!/bin/sh
picom &
megasync &
flameshot &
discord &
xfce4-power-manager &
gnome-keyring-daemon &
numlockx &
nitrogen --restore &
/opt/PreMiD-Portable.AppImage --no-sandbox &

xrandr --output DisplayPort-0 --mode 2560x1440 --rate 144
xrandr --output HDMI-A-0 --left-of DP-0
exec awesome
