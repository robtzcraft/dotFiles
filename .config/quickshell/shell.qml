
import "modules/StatusBar"
import "modules/About"
import "modules/QuickshellConfigurations"
import "modules/Notifications"

import QtQuick

import Quickshell

ShellRoot {

    // On hyprland starting
    StatusBar { }

    Module { }

    About {
        id: aboutPage
    }
    
    LazyLoader {
        id: quickshellConfigsLoader
        loading: false
        QuickshellConfigs {
            visible: true
        }
    }
}
