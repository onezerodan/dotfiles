#!/usr/bin/bash

# Volume notification: Pulseaudio and dunst
# inspired by gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a


icon_path=/usr/share/icons/Adwaita/scalable/status/
notify_id=506
sink_nr="$(pacmd list-sinks | grep "*"  | sed 's/[^0-9]*//g')"   # use `pacmd list-sinks` to find out sink_nr


function get_volume {
    pacmd list-sinks | awk '/\tvolume:/ { print $5 }' | tail -n+$((sink_nr+1)) | head -n1 | cut -d '%' -f 1
}

function get_volume_icon {
    if [ "$1" -lt 34 ]
    then
        echo -n "audio-volume-low-symbolic.svg"
    elif [ "$1" -lt 67 ]
    then
        echo -n "audio-volume-medium-symbolic.svg"
    elif [ "$1" -le 100 ]
    then
        echo -n "audio-volume-high-symbolic.svg"
    else
        echo -n "audio-volume-overamplified-symbolic.svg"
    fi
}

function volume_notification {
    volume=`get_volume`
    vol_icon=`get_volume_icon $volume`
    bar=$(seq -s "─" $(($volume / 5)) | sed 's/[0-9]//g')
    notify-send.sh -r $notify_id -u low -i $icon_path$vol_icon $bar
}

function mute_notification {
    muted=$(pacmd list-sinks | awk '/muted/ { print $2 }' | tail -n+$((sink_nr+1)) | head -n1)
    if [ $muted == 'yes' ]
    then
        notify-send.sh -r $notify_id -u low -i ${icon_path}audio-volume-muted-symbolic.symbolic.svg mute
    else
        notify-send.sh -r $notify_id -u low -i ${icon_path}`get_volume_icon $(get_volume)` unmute
    fi
}

case $1 in
    up)
        pactl set-sink-volume $sink_nr +2%
        volume_notification
        ;;
    down)
        pactl set-sink-volume $sink_nr -2%
        volume_notification
	    ;;
    mute)
        pactl set-sink-mute $sink_nr toggle
        mute_notification
        ;;
    *)
        echo "Usage: $0 up | down | mute"
        ;;
esac

