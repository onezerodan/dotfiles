#!/usr/bin/env bash  

theme="style_2"

dir="$HOME/.config/rofi/launchers/text"
styles=($(ls -p --hide="colors.rasi" $dir/styles))
color="${styles[1]}"

# comment this line to disable random colors
sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

# comment these lines to disable random style
#themes=($(ls -p --hide="launcher.sh" --hide="styles" $dir))
#theme="${themes[$(( $RANDOM % 7 ))]}"

#rofi -no-lazy-grab -show-icons -show drun \
#-modi run,drun,window \
#-theme $dir/"$theme"

rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}' -theme $dir/"$theme" -monitor DP-1
