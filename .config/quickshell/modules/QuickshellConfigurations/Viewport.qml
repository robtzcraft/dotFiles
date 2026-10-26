
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {

    id: root

    property var windows: ({
        "Wifi": "ConfigWindows/Wifi.qml",
        "About": "ConfigWindows/AboutThisMachine.qml",
        "Bluetooth": "ConfigWindows/Bluetooth.qml"
    })
    property string focusWindow: 'About'

    color: "white"
    Layout.fillWidth: true
    Layout.fillHeight: true

    Loader {
        anchors.fill: parent
        source: root.windows[ root.focusWindow ] ?? ""
    }
}
