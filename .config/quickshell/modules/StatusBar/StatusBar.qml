
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

    // Processes
    Process {
        id: process_closeHyprlandSession
        command: ["hyprctl", "dispatch", "hl.dsp.exit()"]
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
        MetricCard { content: `${Time.date}` }
        MetricCard { content: `${Time.hour}` }
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
                    anchors.fill: parent;
                    hoverEnabled: true;
                    cursorShape: Qt.PointingHandCursor;
                    onClicked: Hyprland.dispatch(`hl.dsp.focus( { workspace = ${modelData + 1} } )`);
                }
            }
        }
    }

    // System data
    SectionContainer {
        positionX: parent.width - this.width - 6
        positionY: ConfigServices.paddingGlobal

        ActionCard { content: ""; tooltipText: "Something"; fontSize: 14; onClicked: process_reloadWallpaper.running = true }

        MetricCard { content: Bluetooth.bluetoothStatus.icon; fontSize: 15 }
        
        RowLayout {
            MetricCard { content: `${ Network.wifiStatus.icon }`; isActive: Network.wifiStatus.isActive; fontSize: 14 }
            MetricCard { content: `${ Network.ethernet.icon }`; isActive: Network.ethernet.isActive; fontSize: 14 }
        }
        RowLayout {
            MetricCard { content: `${Battery.batteryLevelIcon}${Battery.isCharging}`; fontSize: 15 }
            MetricCard { content: `${Battery.batteryLevel}%` }
        }


        ActionCard { content: "󰍃"; fontSize: 14; onClicked: process_closeHyprlandSession.running = true }
    }
}
