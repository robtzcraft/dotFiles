
import QtQuick 

Rectangle {
    id: button

    property string icon: ""
    property string iconColor: "#458588"
    property string content: ""
    property int fontSize: 24

    signal clicked()

    color: buttonAction.containsMouse ? "grey" : "transparent"
    implicitWidth: parent.width
    implicitHeight: 30
    radius: borderRadius

    Text {
        text: icon
        font.pointSize: 16
        color: iconColor
    }

    Text {
        text: content
    }

    MouseArea {
        id: buttonAction

        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onClicked: button.clicked()
    }

    Behavior on color {
        ColorAnimation {
            duration: 150
        }
    }
}
