#!/usr/bin/env bash
#----------------------------------------------------
# Author:       Max "keks" Fischer
#
# File:         .xinitrc
#----------------------------------------------------

# mouse stuff
if [[ $HOSTNAME == 'mehl' ]]; then
    # monitor s***
	xrandr --output DVI-D-1 --mode 1920x1080 --output DP-1 --primary --mode 2560x1440 --right-of DVI-D-1

	# unclutter -idle 4 &
	xset m 1 1 &

    # pulseaudio control
    pasystray &

    # notification daemon
#    dunst \
#      -fn "Dejavu 12" \
#      -follow keyboard \
#      -format "<b>%s</b>\n\n%b" \
#      -geometry "300x5-30+20" \
#      -horizontal_padding 16 \
#      -markup \
#      -padding 18 \
#      -separator_height 1 \
#      -word_wrap &
    dunst &

    # adjust light spectrum for better sleeping
	redshift &

    # Automount removeable media
    udiskie -2 -s &


elif [[ $HOSTNAME == 'brei' ]]; then
	# unclutter -idle 4 &
	# xset m 7 1 &
	# xset fp+ /usr/share/fonts/local
	synclient TouchpadOff=1
	(sleep 2 && /usr/bin/urxvtd -q -o -f) &
fi


# keyboard stuff
setxkbmap -option terminate:ctrl_alt_bksp &
(sleep 3 && xmodmap "${HOME}"/.xmodmaprc) &

# visual stuff
xrdb -load "${HOME}"/.Xresources

# wallpaper
sh "${HOME}"/.fehbg &

# dropbox
#dropbox-cli start

# java programs should behave sane
wmname LG3D

# compositing
compton -bf --fade-delta=4 --sw-opti

# clipboard syncing
autocutsel &
autocutsel -s PRIMARY & 

# dwm
# while true; do
# 	$HOME/devel/bash/dwm_status.sh
# 	sleep 2s
# done &
# exec $HOME/bin/dwm

# i3
exec i3
