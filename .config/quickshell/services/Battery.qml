
pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root
    // 󱐋
    property string isCharging: UPower.displayDevice.state === UPowerDeviceState.Charging ? "󱐋": "";
    property var batteryIcons: [ "󰁻","󰁽","󰁿","󰂁","󰁹" ];
    property string batteryLevelIcon: batteryIcons[ Math.min( Math.floor( batteryLevel / 20 ), 9 ) ];
    property var batteryLevel: Math.round( UPower.displayDevice.percentage * 100 );
}
