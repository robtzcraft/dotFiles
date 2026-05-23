
## LockScreen (Hyprlock)

# 2. User Interface

## 2.1 Colors

Offically, the user can choose accross different colorscheme according to the user preferences, all
colorschemes must have the following structure: 

* `bg[0-6]`
* `central`
* `fg[0-6]`
* `red, orange, yellow, green, aqua, blue, purple, [ , 1]`

Making a total of **29** colors per theme.

By default, the current repository comes with 6 colorschemes:

* `gruvbox dark` (default with installation)
* `gruvbox light`
* `nord dark`
* `nord light`
* `catppuccin dark`
* `catppuccin light`

All these these are addapted to the UI robtz requeriments, for example, nord themes has extra 
colors and tones, while catppuccin has less than original colorschemes.

The user can create extra colorschemes using the `Config Panel`.

## 2.1 Widgets (Quickshell)

## 2.2 Wallpaper (Hyprpaper)

The `wallpaper` is defined and managed by `hyprpaper` using an IPC command and reading the 
`config.json` file located at `$HOME/.config/`, the IPC reads the `wallpaper` key and use it to 
resolve the path to the image that will be displayed on screen.

Default location for images: `dotFiles/.config/hypr/src/wallpapers/`

If you want to define other location for your wallpapers please modify the `wallpaperFolderLocation`
and `wallpaper` values on `$HOME/.config/config.json`.
