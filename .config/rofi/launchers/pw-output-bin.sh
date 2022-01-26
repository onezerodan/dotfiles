#!/bin/bash



#echo "$(wpctl status | sed -n '/Audio/,/Video/p' | sed -n '/Sinks/,/Sink endpoints/p' | sed '1d;$d' | sed 's/[│]//g')"


output="$(wpctl status | sed -n '/Audio/,/Video/p' | sed -n '/Sinks/,/Sink endpoints/p' | sed '1d;$d' | sed 's/[│]//g' | sed '/^[[:space:]]*$/d' | sed 's/\[[^]]*\]//g')"

readarray -t array <<<"$output"



for i in "${array[@]}"
do
    if [ x"$@" = x"$i" ]
    then
	    sink="$(sed 's/^[^0-9]*\([0-9]\+\).*$/\1/' <<< "$i")"

	    wpctl set-default $sink
	    notify-send.sh "Audio output" "Switched to $i" -u low --icon=speaker 
	     exit 0
	    
    fi
	
done 

for i in "${array[@]}"
do
    if [[ "$i" = *"*"* ]]; then	
	echo hi	
    else
	echo hello	
    fi
	
done 

