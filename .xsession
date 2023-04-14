#!/bin/sh
picom &
nitrogen --restore &
xrandr --output HDMI-A-0 --left-of DisplayPort-0 &
exec awesome
