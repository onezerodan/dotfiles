#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


#if [[ -z "$DISPLAY" ]] 
#then
#    DISPLAY=":0" 
#    export DISPLAY 
#fi



#if [ "$(command -v startxfce4)" >/dev/null 2>&1 ];
#then
#    exec startxfce4 --with-ck-launch
##fi
#
#if [ "$(command -v bspwm)" >/dev/null 2>&1 ];
#then
#   exec /home/cuda/.config/scripts/autostart.sh;
#else
#    printf "Install a DE/WM\n"
#fi


if [ "$(command -v bspwm)" >/dev/null 2>&1 ];
then
   sh /home/cuda/.config/scripts/autostart.sh
else
    printf "Install a DE/WM\n"
fi

# Xfce передаётся по умолчанию
#session=${1:-bspwm}

#case $session in
 #    bspwm             ) sh /home/cuda/.config/scripts/autostart.sh;;
#     xfce|xfce4        ) exec startxfce4;;
     # Не известная сессия, попробуйте запустить в качестве команды
#     *) exec $1;;
#esac
