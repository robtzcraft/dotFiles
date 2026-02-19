


## LockScreen (Hyprlock)

# 2. User Interface

## 2.1 Widgets (Quickshell)

## 2.2 Wallpaper (Hyprpaper)

The `wallpaper` is defined and managed by `hyprpaper` using an IPC command and reading the 
`config.json` file located at `$HOME/.config/`, the IPC reads the `wallpaper` key and use it to 
resolve the path to the image that will be displayed on screen.

Default location for images: `dotFiles/.config/hypr/src/wallpapers/`

If you want to define other location for your wallpapers please modify the `wallpaperFolderLocation`
and `wallpaper` values on `$HOME/.config/config.json`.
