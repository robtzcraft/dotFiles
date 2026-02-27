
import "modules/StatusBar"

import QtQuick

import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import Quickshell.Wayland
import Quickshell.Hyprland

ShellRoot {

    property int paddingGlobal: 6

    // Fonts
    property string sansFont: "SF Pro"
    property string monospaceFont: "JetBrains Mono Nerd Font"
    property string monoPropoFont: "JetBrains Mono Nerd Font Propo"
    property string batteryData: ""

    // Colors: Gruvbox colorscheme
    readonly property string color_orange_1: "#F38019"
    readonly property string color_orange: "#D65D0E"
    readonly property string color_blue: "#458588"
    readonly property string color_blue_1: "#83A598"
    readonly property string color_fg0: "#FBF1C7"
    readonly property string color_fg1: "#EBDBB2"
    readonly property string color_fg2: "#D5C4A1"
    readonly property string color_fg3: "#BDAE93"
    readonly property string color_fg4: "#A89984"
    readonly property string color_gray1: "#928374"
    readonly property string color_bg4: "#7C6F64"
    readonly property string color_bg3: "#665C54"
    readonly property string color_bg2: "#504945"
    readonly property string color_bg1: "#3C3836"
    readonly property string color_bg0s: "#32302F"
    readonly property string color_bg0: "#282828"
    readonly property string color_bg0h: "#1D2021"
    readonly property string color_bg: "#1D2021"

    StatusBar { }

}
