#!/bin/bash

pid=$(ps -o pid --no-headers -C "sxiv -Z -g 1280x1024+0+0 $HOME/Pictures/Wallpapers/jian.png")

if ps -C "sxiv -z 110 -b -g 1280x1024+0+0 $HOME/Pictures/Wallpapers/jian.png" > /dev/null
then
	echo runnin
	kill -TERM $pid	
else
	echo notrunninn
	bspc rule -a \* -o state=floating && sxiv -z	110 -b -g 1100x660+0+0 $HOME/Pictures/Wallpapers/jian.png
fi

