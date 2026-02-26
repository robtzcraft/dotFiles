
import "."

/* QtQuick */
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/* Quickshell */
import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import Quickshell.Hyprland

Item {

    property var batteryLevel: Math.round( UPower.displayDevice.percentage * 100 )
    property string batteryStatus: {
        const state = UPower.displayDevice.state
        if (state === UPowerDeviceState.Charging) {
            return "Charging"
        } else {
            return ""
        }
    }

    property var batteryIcons: ["󰁻","󰁽","󰁿","󰂁","󰁹"]
    property string batteryLevelIcon: batteryIcons[Math.min(Math.floor(batteryLevel / 20), 9)]


    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
    // Processes
    Process {
        id: process_closeHyprlandSession
        command: ["hyprctl", "dispatch", "exit"]
    }
    Process {
        id: process_aboutThisDevice
        command: ["kitty", "--hold", "fastfetch"]
    }

    // SessionOptions
    PanelWindow {
        id: statusBar_SessionOptions
        visible: false

        Rectangle {
            Text {
                text: "Hola"
            }
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
            }
        }
    }

    PopupWindow {
        id: popupTest
        visible: false
        width: 240
        height: 160
        color: "#444"

        anchor.window: statusBar
        anchor.rect.x: 100
        anchor.rect.y: statusBar.heigth

        HyprlandFocusGrab {
            active: popupTest.visible
            windows: [popupTest]
            onCleared: {
                popupTest.visible = false
                popupTest.requestActivate()
            }
        }

        Text {
            anchors.centerIn: parent
            text: "test"
            color: "white"
            font.pixelSize: 16
        }
    }

    Component {

        /* DataDisplayer
         * Function: Only to display data, hover and other interectations not allowed */

        id: dataDisplayer

        Rectangle {
            id: dataDisplayerContainer
            implicitWidth: childrenRect.width + paddingGlobal
            implicitHeight: 26
            color: "transparent"
            property string stringData: ""
            Text {
                anchors.centerIn: dataDisplayerContainer
                text: stringData
                color: "#D5C4A1"
                font.pointSize: 12
                font.family: sansFont
                font.weight: 600
            }
        }
    }

    // StatusBar
    PanelWindow {

        // Properties
        id: statusBar
        implicitHeight: 46
        visible: true
        color: "transparent"
        anchors { top: true; left: true; right: true }

        property int paddingContainer: 12

        // LeftContent
        Rectangle {
            x: paddingGlobal
            y: paddingGlobal
            implicitWidth: childrenRect.width + ( paddingGlobal * 2 )
            implicitHeight: parent.height - ( 2 * paddingGlobal )
            color: background
            radius: 10

            RowLayout {

                x: paddingGlobal
                y: ( parent.height / 2 ) - ( this.height / 2 )

                width: childrenRect.width + ( paddingGlobal )

                Rectangle {

                    height: parent.parent.height - 10
                    width: this.height
                    color: "transparent"

                    Text {
                        x: parent.width / 2 - (this.width / 2)
                        y: parent.height / 2 - (this.height / 2)
                        text: "󰣇"
                        font.pointSize: 28 / 1.6
                        color: archIconHandler.containsMouse ? "#8EC07C" : "#FBF1C7"
                        Behavior on color { 
                            ColorAnimation { duration: 200 } 
                        }
                    }


                    MouseArea {
                        id: archIconHandler
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            popupTest.visible = !popupTest.visible
                            // statusBar_SessionOptions.visible = !statusBar_SessionOptions.visible
                        }
                    }
                }

                /* Date [ Month / Day -- hh:mm AP ] */
                DataDisplayer { itemData: `${Qt.formatDateTime(clock.date, "MMM dd")}` }
                DataDisplayer { itemData: `${Qt.formatDateTime(clock.date, "hh:mm AP")}` }

            }
            Behavior on color { ColorAnimation { duration: 200 } }
        }

        // CenterConter
        Rectangle {

            id: containerWorkspaces

            x: ( parent.width / 2 ) - ( this.width / 2 )
            y: paddingGlobal
            implicitWidth: childrenRect.width + ( paddingGlobal * 2 ) + 14
            implicitHeight: parent.height - ( 2 * paddingGlobal )
            color: background
            radius: 10
            RowLayout {
                spacing: 10
                anchors.centerIn: parent
                Repeater {
                    model: 5
                    Rectangle {
                        width: 16
                        height: this.width
                        radius: this.width / 2
                        color: {
                            if((modelData + 1) == Hyprland.focusedWorkspace.id){
                                "#FB4934"
                            } else {
                                "#FBF1C7"
                            }
                        }
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                Hyprland.dispatch(`workspace ${modelData + 1}`)
                            }
                        }
                    }
                }
            }
        }

        // Right Elements
        Rectangle {

            id: containerRight
            
            x: parent.width - this.width - 6
            y: paddingGlobal
            implicitWidth: childrenRect.width + ( paddingGlobal * 3 )
            implicitHeight: parent.height - ( 2 * paddingGlobal )
            color: background
            radius: 10

            RowLayout {
                spacing: 6
                anchors.centerIn: parent
                Rectangle {
                    width: childrenRect.width + 10
                    height: containerRight.height
                    color: "transparent"
                    RowLayout {
                        anchors.centerIn: parent
                        Text {
                            text: `${batteryLevelIcon}${batteryStatus}`
                            font.family: `${sansFont}`
                            font.pointSize: 24 / 1.6
                            color: "#FBF1C7"
                        }
                        Text {
                            text: `${batteryLevel}%`
                            font.family: sansFont
                            font.pointSize: 16 / 1.6
                            font.weight: 700
                            color: "#FBF1C7"
                        } 
                    }
                }
                Rectangle {
                        id: statusBarButton
                        color: "transparent"
                        width: childrenRect.width + 2 // + ( paddingGlobal * 2 )
                        height: parent.parent.height
                        radius: 4

                        Text {
                            anchors.centerIn: parent
                            text: "󰍃"
                            font.pointSize: 14
                            font.family: monoPropoFont
                            font.weight: 100
                            color: mouseHandler.containsMouse ? "#8EC07C" : "#FBF1C7"
    
                            Behavior on color { 
                                ColorAnimation { duration: 200 } 
                            }
                        }

                        MouseArea {
                            id: mouseHandler
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            hoverEnabled: true
                            onClicked: {
                                process_closeHyprlandSession.running = true
                        }
                    }
                }
            }
        }
    }
}
