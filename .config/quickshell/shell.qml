
import "modules/StatusBar"
import "modules/QuickshellConfigurations"

import QtQuick

import Quickshell

ShellRoot {

    // On hyprland starting
    StatusBar { }
    
    LazyLoader {
        id: quickshellConfigsLoader
        loading: false
        QuickshellConfigs {
            visible: true
        }
    }
}
