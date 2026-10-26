
import QtQuick
import QtQuick.Layouts

Item {

    anchors.fill: parent

    Rectangle {

        width: 80
        height: 80
        color: "lightsteelblue"

        anchors.centerIn: parent

        Text {
            anchors.centerIn: parent
            text: "About this machine"
            color: "red"
        }
    }
}
