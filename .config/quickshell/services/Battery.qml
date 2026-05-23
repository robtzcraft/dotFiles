
pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root

    property string batteryStatus: {
        const state = UPower.displayDevice.state
        return(state === UPowerDeviceState.Charging) ? "󱐋" : "";
    }

    property var batteryIcons: ["󰁻","󰁽","󰁿","󰂁","󰁹"]
    property string batteryLevelIcon: batteryIcons[Math.min(Math.floor(batteryLevel / 20), 9)]
    property var batteryLevel: Math.round( UPower.displayDevice.percentage * 100 )
}