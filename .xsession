#!/bin/sh
picom &
megasync &
flameshot &
discord &
xfce4-power-manager &
gnome-keyring-daemon &
numlockx &
/opt/PreMiD-Portable.AppImage --no-sandbox &

xrandr --output DisplayPort-0 --mode 2560x1440 --rate 144
xrandr --output HDMI-A-0 --off
#xrandr --output DisplayPort-0 --mode 2560x1440 --rate 144
#xrandr --output HDMI-A-0 --left-of DisplayPort-0
nitrogen --restore

# enable soft touchpad
xinput set-prop "$(xinput list --name-only | grep -i touch)" "libinput Tapping Enabled" 1

exec awesome
