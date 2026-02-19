
// pragma: to check

import "modules"

import QtQuick
import Quickshell
import Quickshell.Io

import Quickshell.Services.UPower

// import Quickshell.Effects
import Quickshell.Wayland
import Quickshell.Hyprland

ShellRoot {

    // property var config: ({})

    property int paddingGlobal: 6
    property color background: "#282828"
    property color bg0_s: "#32302F"

    // Fonts
    property string sansFont: "Noto Sans"
    property string monospaceFont: "JetBrains Mono Nerd Font"
    property string monoPropoFont: "JetBrains Mono Nerd Font Propo"

    property string batteryData: ""

    Process {
        id: getBatteryData
        command: ["sh", "-c", "upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | grep -oP \'\\d+%\'"]

        Component.onCompleted: {
            running = true
        }

        stdout: SplitParser {
            onRead: data => {
                batteryData = data
                // console.log(batteryObject.percentage_data)
            }
        }
    }

    Timer {
        interval: 30000
        running: true
        repeat: true
        onTriggered: getBatteryData.running = true
    }

    // Lector de archivo JSON usando FileView
    // FileView {
    //    id: configFile
    //    path: Qt.resolvedUrl("./config.json")
    //    blockLoading: true  // Fuerza la carga antes de parsear

        // Live Changes
    //    watchChanges: true
    //    onFileChanged: { 
    //        // DEBUG
    //        console.log("ColorScheme modified")
    //        command: ["sleep", "0.1"]
    //        this.reload() 
    //    }
    //}

    // Parsear el JSON cuando el archivo está cargado
    // readonly property var jsonData: JSON.parse(configFile.text())

    /*
    Component.onCompleted: {
        try {
            config = jsonData;
            // console.log("Loaded Scheme:", config.colorscheme);
            paddingGlobal = config.padding || 6;
            background = config[`colorScheme${config.colorScheme}`].bg || "#282828";
            console.log(`config.colorScheme${config["colorScheme"]}.bg`)
            sansFont = config["fontScheme"].sans;
            monospaceFont = config["fontScheme"].monospace;
            monoPropoFont = config["fontScheme"].monospacePropo;
            
        } catch (e) {
            console.error("Error al cargar config.json:", e);
        }
    }*/


    StatusBar { }

    Loader {
        id: testLoader
        active: false
        sourceComponent: PanelWindow {
            id: testComponent

            Rectangle {
                width: 200
                height: 200
                color: "white"
            }

        }
    }

}
