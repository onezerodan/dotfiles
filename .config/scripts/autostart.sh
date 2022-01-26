#!/bin/bash

# Start audio server
#exec bluealsa &
pulseaudio --start &
spotifyd &
#exec pipewire &


# Restore wallpapers
$HOME/.config/scripts/display_config.sh &
xrdb /home/cuda/.Xresources &
nitrogen --restore &

# Enable cursor
xsetroot -cursor_name left_ptr &

# Set mouse sensetivity
#xinput --set-prop 12 "libinput Accel Speed" -0.4 &

# Start compositor
picom --config /home/cuda/.config/picom/picom.conf --respect-prop-shadow &

# Spawn clipboard daemon 
greenclip daemon &

# change layout shortcut
sleep 3s && setxkbmap -option grp:alt_space_toggle -layout us,ru &

# Start auto {lock, screensaver, suspend}
xautolock -detectsleep -notify 600 -notifier "xset dpms force off" -time 20 -locker "betterlockscreen -l" -killtime 30 -killer "loginctl suspend" &

# Start polit service
exec /usr/libexec/polkit-gnome-authentication-agent-1 & 

# Intellij grey screen fix
#wmname LG3D &

# Enable numlock
numlockx on &

pulseaudio -k &


# Launch WM
exec dbus-launch --exit-with-session bspwm 

