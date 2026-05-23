
import QtQuick
import Quickshell
import QtQuick.Effects
import Quickshell.Wayland

import "."
import "../../"
import "../../services"

PanelWindow {

    id: root

    anchors {
        top: true
        right: true
    }

    visible: (Notifications.toasts.length > 0) ? true : false

    margins.right: 0
    implicitWidth: 366
    implicitHeight: (toastColumn.implicitHeight == 0)? 0: toastColumn.implicitHeight + 20
    color: "white"
    WlrLayershell.layer: WlrLayer.Overlay

    RectangularShadow {
        anchors.fill: toastColumn
        offset.x: 0
        offset.y: 0
        radius: notificationCard.radius
        blur: 6
        spread: 2
        color: Qt.darker(root.color, 1.6)
    }

    Connections {
        target: Notifications
        function onReceived(notif) {
            var ms = notif.expireTimeout > 0
                     ? notif.expireTimeout * 1000
                     : 6000
            dismissTimer.createObject(root, { notifRef: notif, interval: ms })
        }
    }

    Component {
        id: dismissTimer
        Timer {
            property var notifRef
            running: true
            repeat:  false
            onTriggered: {
                Notifications.dismissToast(notifRef)
                destroy()
            }
        }
    }

    Column {

        id: toastColumn
        width: parent.width
        anchors { 
            top: parent.top; 
            right: parent.right; 
            margins: 0
        }
        spacing: 8

        Repeater {
            model: Notifications.toasts

            NotificationCard {

                id: notificationCardTest

                required property var modelData
                notif: modelData
                onDismissed: Notifications.dismissToast(modelData)
            }
        }
    }

}
