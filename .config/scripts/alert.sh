#!/bin/bash
type=$1

case "$type" in
"low")
    mpv /home/cuda/Audio/Sounds/low.mp3 &
    ;;
"normal")
    mpv /home/cuda/Audio/Sounds/normal.mp3 &
    ;;

*)
    mpv /home/cuda/Audio/Sounds/normal.mp3 &
    ;;
esac




