#!/bin/sh

#-----------------------------------
# file:             .xinitrc
# author:           keks
# last modified:    February 2011
#-----------------------------------

# mouse stuff
xset m 1 1 &
unclutter -idle 4 &

# keyboard stuff
setxkbmap -option terminate:ctrl_alt_bksp &
xrdb -merge $HOME/.Xdefaults &
(sleep 3 && xmodmap $HOME/.xmodmaprc) &

# wallpaper
sh $HOME/.fehbg

# terminal emulator daemon
/usr/bin/urxvtd -q -o -f &

# dropbox
(sleep 60 && /usr/bin/dropboxd) &

# dwm
while true; do
    $HOME/devel/bash/dwm_status.sh
    sleep 2s
done &
exec $HOME/bin/dwm
