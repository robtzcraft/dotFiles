pragma Singleton

import Quickshell

Singleton {

    id: root

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    property var date: Qt.formatDateTime(clock.date, "MMM dd")
    property var hour: Qt.formatDateTime(clock.date, "hh:mm AP")

}