
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
        return (state === UPowerDeviceState.Charging) ? "󱐋" : ""
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

    // StatusBar
    PanelWindow {

        // Properties
        id: statusBar
        implicitHeight: 50
        visible: true
        color: "transparent"
        anchors { top: true; left: true; right: true }

        property int paddingContainer: 12

        SectionContainer {
            positionX: paddingGlobal
            positionY: paddingGlobal
            ActionCard { content: "󰣇"; onClicked: process_aboutThisDevice.running = true }
            MetricCard { itemData: `${Qt.formatDateTime(clock.date, "MMM dd")}` }
            MetricCard { itemData: `${Qt.formatDateTime(clock.date, "hh:mm AP")}` }
        }

        // CenterConter

        SectionContainer {
            positionX: ( parent.width / 2 ) - ( this.width / 2 )
            positionY: paddingGlobal
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


        // Right
        SectionContainer {

            positionX: parent.width - this.width - 6
            positionY: paddingGlobal
            
            RowLayout {
            
                // batteryStatus is not displayed if not charging
                MetricCard { itemData: `${batteryLevelIcon}${batteryStatus}`; fontSize: 14 }
                MetricCard { itemData: `${batteryLevel}%` }        
            
            }
            
            // Close hyprland session
            ActionCard { content: "󰍃"; fontSize: 14; onClicked: process_closeHyprlandSession.running = true }
        }
    }
}
