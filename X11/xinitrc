#!/bin/sh
$OLD=$(pwd)

cd ~/dev/music-rpc
./env/bin/python3 scan.py &
cd $OLD

picom &
nitrogen --restore &
xrandr --output HDMI-A-0 --left-of DisplayPort-0 &
exec awesome
