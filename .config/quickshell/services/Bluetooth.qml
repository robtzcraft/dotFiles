
pragma Singleton;

import QtQuick;
import Quickshell.Bluetooth;

QtObject {
    id: root;

    property var defaultAdapter: Bluetooth.defaultAdapter
    property bool isBluetoothAdapterAwake: defaultAdapter.enabled;
    property string bluetoothAdapterName: defaultAdapter.name;
    property var test: 'test';

    property var bluetoothStatus: {
        if( isBluetoothAdapterAwake ) {
            for( const device of defaultAdapter.devices.values ){
                if( device.connected ){ return { icon: '󰂱', isActive: true } }
            }
            return { icon: '󰂯', isActive: true };
        } else {
            return { icon: '󰂲', isActive: false };
        }
    }
}