
import "."
import "../../services"
// import "../../"

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

PanelWindow {

    id: statusBar

    // property string testString: ""

/*    Process {
        id: testForOutput
        command: ["stdbuf", "-oL", `${ConfigServices.homeURL}/Documents/dotFiles/.config/quickshell/services/mi_binario`]
        running: true

        stdout: SplitParser {
            onRead: data => testString = data;
        }
    }*/

    // Processes
    Process {
        id: process_closeHyprlandSession
        command: ["hyprctl", "dispatch", "exit"]
    }

    Process {
        id: process_reloadWallpaper
        command: ["sh", `${ConfigServices.homeURL}/Documents/dotFiles/scripts/wallpaperHandler.sh`]
    }

    // Properties
    implicitHeight: 50
    visible: true
    color: "transparent"
    anchors { top: true; left: true; right: true }

    // Date data
    SectionContainer {

        positionX: ConfigServices.paddingGlobal
        positionY: ConfigServices.paddingGlobal

        ActionCard { 
            content: "󰣇"; 
            onClicked: {
                if(quickshellConfigsLoader.active === false) {
                    quickshellConfigsLoader.loading = true
                    quickshellConfigsLoader.active = true
                } else {
                    quickshellConfigsLoader.active = false
                }
            } 
        }
        MetricCard { itemData: `${Time.date}` }
        MetricCard { itemData: `${Time.hour}` }
    }

    // Workspaces
    SectionContainer {
        positionX: ( parent.width / 2 ) - ( this.width / 2 )
        positionY: ConfigServices.paddingGlobal
        
        Repeater {
            model: 5
            Rectangle {
                width: 16
                height: this.width
                radius: this.width / 2
                color: ((modelData + 1) == Hyprland.focusedWorkspace.id) ? ConfigServices.focusedColor : ConfigServices.foregroundColor
                Behavior on color { ColorAnimation { duration: 120 } }
            
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

    // System data
    SectionContainer {
        positionX: parent.width - this.width - 6
        positionY: ConfigServices.paddingGlobal

        ActionCard { content: ""; fontSize: 14; onClicked: process_reloadWallpaper.running = true }
        // MetricCard { itemData: `${Network.ssid}` }

        RowLayout {
            // batteryStatus is not displayed if not charging
            MetricCard { itemData: `${Battery.batteryLevelIcon}${Battery.batteryStatus}`; fontSize: 14 }
            MetricCard { itemData: `${Battery.batteryLevel}%` }
            // MetricCard { itemData: `${testString}` }
        }
        ActionCard { content: "󰍃"; fontSize: 14; onClicked: process_closeHyprlandSession.running = true }
    }
}
