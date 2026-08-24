
pragma Singleton;

import Quickshell;
import Quickshell.Networking;

/*
 *  Types ( Networking.device.values[n].type )
 *      1. Wi-Fi
 *      2. Wired
 */

Singleton {
    id: root;

    property var networkDevices: Networking.devices.values;
    property var wifiIcons: [ "󰤯","󰤟","󰤢","󰤥","󰤨" ];
    property object ethernet: { isActive: true, icon: "1" }
    property object wifiStatus: { isActive: true, icon: "1" }

    /* If wired then the icon of wiring changes */
    ethernet: {
        for( const device of networkDevices ) {
            if( device.type === 2 ) {
                return { isActive: true , icon: '󰈀' }
            }
        }
        return { isActive: false, icon: '󰅛' };
    }

    wifiStatus: {
        try {
            if( Networking.wifiEnabled !== true ) {
                return { isActive: false, icon: '󰤭' };
            }
            for( const device of networkDevices ) {
                if( device.type !== 1 ) continue;
                const networks = device.networks && device.networks.values;
                if( !networks || networks.length === 0 ) continue;

                const strength = networks[0].signalStrength;
                if( strength === undefined || strength === null ) continue;

                const idx = Math.min( Math.floor( Math.round( strength * 100 ) / 20 ), 9 );
                return { isActive: true, icon: wifiIcons[ idx ] };
            }
            return { isActive: false, icon: '󰤭' };
        } catch( e ) {
            console.warn( "wifiStatus error:", e );
            return { isActive: false, icon: '󰤭' };
        }
    }
}

