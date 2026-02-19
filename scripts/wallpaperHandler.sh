#!/bin/bash

wallpaper_name=$(jq -r '.ui.wallpaper.wallpaperSelected' "$HOME/.config/config.json")
path_to_wallpaper=$(jq -r '.ui.wallpaper.path' "$HOME/.config/config.json")
full_path="${path_to_wallpaper}${wallpaper_name}"

echo $full_path

#echo $full_path
hyprctl hyprpaper wallpaper ",${full_path},cover"
