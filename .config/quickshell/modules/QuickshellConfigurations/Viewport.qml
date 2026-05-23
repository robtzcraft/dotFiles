
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// import Quickshell

Rectangle {

    id: root

    color: foregroundColor
    Layout.fillWidth: true
    Layout.fillHeight: true

    ComboBox {

        id: colorSchemeSelector
        model: ["test", "test2", "test3"]

        background: Rectangle {
            color: "red"
            implicitWidth: 200
            implicitHeight: 30
            radius: 8
        } 
 
    }
}
