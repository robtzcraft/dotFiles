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
                        font.pointSize: 18
                        color: "#FBF1C7"
                    }


                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            popupTest.visible = !popupTest.visible
                            // statusBar_SessionOptions.visible = !statusBar_SessionOptions.visible
                        }
                    }
                }

                Text {
                    text: `${batteryLevel}% - ${Qt.formatDateTime(clock.date, "hh:mm")}`
                    font.family: sansFont
                    color: "white"
                }
            }
            Behavior on color { ColorAnimation { duration: 200 } }
        }

        // CenterConter
        Rectangle {
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
            x: parent.width - this.width - 6
            y: paddingGlobal
            implicitWidth: childrenRect.width + ( paddingGlobal * 2 )
            implicitHeight: parent.height - ( 2 * paddingGlobal )
            color: background
            radius: 10

            Rectangle {

                id: statusBarButton

                color: "transparent"

                width: childrenRect.width + 2 // + ( paddingGlobal * 2 )
                height: parent.height - ( paddingGlobal * 2 )
                x: parent.width - this.width - paddingGlobal
                y: paddingGlobal
                radius: 4

                Text {
                    text: "󰍃"
                    font.pointSize: 14
                    font.family: monoPropoFont
                    font.weight: 100
                    color: mouseHandler.containsMouse ? "cyan" : "white"
                    x: ( parent.width / 2 ) - ( this.width / 2 )
                    y: ( parent.height / 2 ) - ( this.height / 2 )

                    // Animation
                    Behavior on color { ColorAnimation { duration: 200 } }
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

            Text {
                font.family: config.fontScheme.monospace
                text: config.colorScheme || "Loading..."
                color: "white"
            }
        }
    }
}
