#!/bin/bash

# Options du menu
choice=$(echo -e " Eteindre\n Redemarrer\n Deconnexion" | wofi --dmenu --width 200 --height 150)

case "$choice" in
    " Eteindre") systemctl poweroff ;;
    " Redemarrer") systemctl reboot ;;
    " Deconnexion") pkill Hyprland ;;
esac
