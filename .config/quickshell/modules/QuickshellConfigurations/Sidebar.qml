import QtQuick
import QtQuick.Layouts
import Quickshell

import "."

Rectangle {
    id: configPanelSidebar

    signal selected( string name )

    property int parentHeight: 0
    color: backgroundColor
    implicitWidth: 260
    implicitHeight: parentHeight

    Behavior on color { ColorAnimation { duration: 600 } }

    ColumnLayout {
        spacing: 0
        anchors.left: parent.left
        anchors.right: parent.right

        Rectangle {
            id: configPanelSidebarTitleContainer
            color: "red"
            implicitWidth: parent.width
            implicitHeight: 50

            Text {
                anchors.centerIn: configPanelSidebarTitleContainer
                text: "System Settings"
                color: "#BAC6DA"
                font.family: sansFont
                font.pointSize: 11
                font.weight: 500
            }
        }

        Button { icon: "󰤨"; content: 'Wi-Fi settings'; onClicked: configPanelSidebar.selected("Wifi") }
        Button { icon: ""; content: 'Bluetooth and Devices'; onClicked: configPanelSidebar.selected("Bluetooth") }
        Button { content: 'VPN'; onClicked: configPanelSidebar.selected("VPN") }
        Button { icon: ""; content: 'System'; onClicked: configPanelSidebar.selected("About") }
        Button { icon: ""; content: 'Apparence'; onClicked: configPanelSidebar.selected("Appearance") }
        Button { icon: "󱅫"; content: 'Notifications'; onClicked: configPanelSidebar.selected("Notifications") }
    }

    Rectangle {
        implicitWidth: 1
        implicitHeight: parent.height
        anchors.right: parent.right
        anchors.rightMargin: 1
        color: "red"
    }
    Rectangle {
        implicitWidth: 1
        implicitHeight: parent.height
        anchors.right: parent.right
        color: "gray"
    }
}