
import QtQuick
import Quickshell

import "."

Rectangle {

    id: configPanelSidebar

    property int parentHeight: 0
    color: backgroundColor
    implicitWidth: 260
    implicitHeight: parentHeight

    Behavior on color { ColorAnimation { duration: 600 } }

    Rectangle {

        id: configPanelSidebarTitleContainer

        color: "transparent"
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
