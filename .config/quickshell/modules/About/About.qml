import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import "../../"

PanelWindow {

    id: about
    // title: "Quickshell Configs"

    color: "transparent"
    WlrLayershell.namespace: "quickshell:about"
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.keyboardFocus: GlobalStates.aboutOpen 
        ? WlrKeyboardFocus.OnDemand 
        : WlrKeyboardFocus.None

    focusable: GlobalStates.aboutOpen

    exclusiveZone: 0
    implicitWidth: 400
    implicitHeight: 240

    visible: GlobalStates.aboutOpen

    HyprlandFocusGrab {
        id: focusGrab
        windows: [ about ]
        active: GlobalStates.aboutOpen
    }

    Connections {
        target: focusGrab
        function onCleared() {
            GlobalStates.aboutOpen = false
        }
    }

    Rectangle {
        anchors.fill: parent
        color: backgroundColor
        radius: 12
    }

    Item {
        anchors.fill: parent
        focus: true
        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_Escape) {
                GlobalStates.aboutOpen = false
                event.accepted = true
            }
        }
    }
}
