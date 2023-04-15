#!/bin/sh
picom &
megasync &
flameshot &
discord &
nitrogen --restore &
xrandr --output HDMI-A-0 --left-of DisplayPort-0 &
exec awesome
