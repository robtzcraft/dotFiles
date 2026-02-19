#!/bin/bash

# Dependencies:
#   * NetworkManager
#   * Brightnessctl
#   * Bluez
#       * Bluez-utils
#   * Pipewire
#   * Pipewire-pulse
#       * Pipewire-alsa
#       * Pipewire-jack
#       * Wireplumber
#   





# Wallpaper
PICTURES_DIR="$HOME/Pictures/Wallpapers"

if [ -d "$PICTURES_DIR" ]; then
    echo "$PICTURES_DIR directory found, skiping..."
else
    echo "$PICTURES_DIR not found, creating..."
    mkdir -p $HOME/Pictures/Wallpapers
fi

# Make a copy of the default wallpaper to Pictures/Wallpapers/
cp ./src/Pictures/default.png $HOME/Pictures/Wallpapers/
echo "Default wallpaper location: $PICTURES_DIR"
