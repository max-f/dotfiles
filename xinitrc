#!/usr/bin/env bash
#----------------------------------------------------
# Author:       Max "keks" Fischer
#
# File:         .xinitrc
#----------------------------------------------------

# mouse stuff
if [[ $HOSTNAME == 'mehl' ]]; then
	# unclutter -idle 4 &
	xset m 1 1 &
#	/usr/bin/redshift &
elif [[ $HOSTNAME == 'brei' ]]; then
	# unclutter -idle 4 &
	xset m 7 1 &
	xset fp+ /usr/share/fonts/local
fi

# keyboard stuff
setxkbmap -option terminate:ctrl_alt_bksp &
(sleep 3 && xmodmap $HOME/.xmodmaprc) &

# visual stuff
xrdb -merge $HOME/.Xresources &

# wallpaper
sh $HOME/.fehbg &

# terminal emulator daemon
#(sleep 2 && /usr/bin/urxvtd -q -o -f) &

# dropbox
(sleep 60 && /usr/bin/dropboxd) &

# dwm
while true; do
	$HOME/devel/bash/dwm_status.sh
	sleep 2s
done &
exec $HOME/bin/dwm
#exec i3
