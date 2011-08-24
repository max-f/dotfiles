#!/usr/bin/env sh
#----------------------------------------------------
# Author:       Max "keks" Fischer
#
# File:         .xinitrc
#----------------------------------------------------

# mouse stuff
if [[ $HOSTNAME == 'mehl' ]]; then
	# unclutter -idle 4 &
	xset m 1 1 &
fi

# keyboard stuff
setxkbmap -option terminate:ctrl_alt_bksp &
(sleep 3 && xmodmap $HOME/.xmodmaprc) &

# visual stuff
xrdb -merge $HOME/.Xresources &

# wallpaper
sh $HOME/.fehbg &

# terminal emulator daemon
(sleep 2 && /usr/bin/urxvtd -q -o -f) &

# dropbox
(sleep 60 && /usr/bin/dropboxd) &

# dwm
while true; do
	$HOME/devel/bash/dwm_status.sh
	sleep 2s
done &
exec $HOME/bin/dwm
