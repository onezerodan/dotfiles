#!/usr/bin/env bash  

theme="style_2"

dir="$HOME/.config/rofi/launchers/text"
styles=($(ls -p --hide="colors.rasi" $dir/styles))
color="${styles[1]}"

# comment this line to disable random colors
sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

rofi -show window -modi window -show-icons -theme $dir/"$theme" -monitor DP-1
