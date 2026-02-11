#!/bin/bash

# Rofi power menu options
options="⏻ Shutdown\n Reboot\n⏾ Suspend\n Hibernate\n Lock\n Logout"

# Show rofi menu and get selection
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" \
    -theme-str 'window {width: 250px;} listview {lines: 6;}')

# Execute based on selection
case $chosen in
    "⏻ Shutdown")
        systemctl poweroff
        ;;
    " Reboot")
        systemctl reboot
        ;;
    "⏾ Suspend")
        systemctl suspend
        ;;
    " Hibernate")
        systemctl hibernate
        ;;
    " Lock")
        swaylock -eFfki ~/Pictures/lockscreen.png
        ;;
    " Logout")
        swaymsg exit
        ;;
esac
