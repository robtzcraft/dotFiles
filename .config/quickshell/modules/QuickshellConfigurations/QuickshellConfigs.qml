
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Quickshell
import Quickshell.Widgets

import "."
import "../../"

FloatingWindow {

    id: root

    title: "Quickshell Configurations"
    implicitWidth: 900
    implicitHeight: 600
    minimumSize: "900x600"
    color: "transparent"
    Behavior on color { ColorAnimation { duration: 200 } }

    RowLayout {

        id: configPanelLayout
        anchors.fill: parent
        spacing: 0

        Sidebar {
            id: configPanelSidebar
            parentHeight: root.height
        }


        Viewport {

        }



    }
    // Button {
//        content: "Qwerty"
//        onClicked: {
//            // Add this command: jq '.ui.colors.variant = "light"' ~/Documents/dotFiles/config.json > ~/Documents/dotFiles/tmp.json && mv ~/Documents/dotFiles/tmp.json ~/Documents/dotFiles/config.json
//        }
//    }

    /* On 'killactive' sequence */
    onClosed: {
        quickshellConfigsLoader.active = false
        quickshellConfigsLoader.loading = false
    }
}
