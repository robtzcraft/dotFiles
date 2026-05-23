
pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    property list<Notification> toasts: []
    property list<Notification> history: []

    signal received(Notification notif)

    NotificationServer {
        actionsSupported:    true
        imageSupported:      true
        keepOnReload:        true

        onNotification: function(notif) {
            notif.tracked = true
            root.toasts.push(notif)
            root.history.push(notif)
            root.received(notif)
        }
    }

    function dismissToast(notif) {
        toasts = toasts.filter(n => n !== notif)
    }
}