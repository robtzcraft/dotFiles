
import "modules"

import QtQuick

import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import Quickshell.Wayland
import Quickshell.Hyprland

ShellRoot {

    property int paddingGlobal: 6
    property color background: "#282828"
    property color bg0_s: "#32302F"

    // Fonts
    property string sansFont: "SF Pro"
    property string monospaceFont: "JetBrains Mono Nerd Font"
    property string monoPropoFont: "JetBrains Mono Nerd Font Propo"
    property string batteryData: ""

    Process {
        id: getBatteryData
        command: ["sh", "-c", "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | grep -oP \'\\d+%\'"]
        Component.onCompleted: running = true
        stdout: SplitParser {
            onRead: data => {
                batteryData = data
            }
        }
    }

    Timer {
        interval: 30000
        running: true
        repeat: true
        onTriggered: getBatteryData.running = true
    }

    StatusBar { }

    Loader {
        id: testLoader
        active: false
        sourceComponent: PanelWindow {
            id: testComponent
            Rectangle {
                width: 200
                height: 200
                color: "white"
            }
        }
    }
}
