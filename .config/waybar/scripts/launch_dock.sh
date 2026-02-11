#!/bin/bash
# ~/.config/hyprland/scripts/toggle-launcher.sh

LAUNCHER_PID=$(pgrep -f "waybar.*launcher-config")

if [ -n "$LAUNCHER_PID" ]; then
    # Si está corriendo, mátalo
    kill $LAUNCHER_PID
else
    # Si no está corriendo, lánzalo
    waybar -c ~/.config/waybar/launcher-config -s ~/.config/waybar/launcher-style.css &
fi
