#!/bin/bash

color=$(xcolor | head -n 1)
BACK_PID=$!
wait $BACK_PID



convert -size 200x200 xc:$color /tmp/colorpicker.png


notify-send.sh ColorPicker "${color} \t copied" -u normal --icon=/tmp/colorpicker.png



echo -n "$color" | xclip -sel clip
