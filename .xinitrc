#!/bin/sh

# file:             .xinitrc
# author:           keks
# last modified:    2010/11/18
#
# keyboard stuff
setxkbmap -option terminate:ctrl_alt_bksp &
xrdb -merge $HOME/.Xdefaults &
(sleep 3 && xmodmap $HOME/.xmodmap) &

# wallpaper 
sh $HOME/.fehbg

# terminal emulator daemon
/usr/bin/urxvtd -q -o -f &

# dropbox
(sleep 60 && /usr/bin/dropboxd) &

# dwm
while true
do 
		#battery=$(acpi -b | awk '{ print $3, $4 }' | tr -d ',')
		battery=$(sh $HOME/devel/bash/battery.sh `acpi -b`)
		volume=$(amixer get Master | sed -n 's/ Front Right: Playback [0-9]\+ \[\([0-9%]\+\)\].*/\1/p')
		dat=$(date '+%a %d.%m.%y - %H:%M')
		xsetroot -name "$battery | vol $volume | $dat"
		sleep 1
done &
exec $HOME/bin/dwm
