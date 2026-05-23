
import QtQuick 

Rectangle {
    
    id: button

    property string content: ""
    property int fontSize: 21

    signal clicked()

    color: "red"
    implicitWidth: 100
    implicitHeight: 30
    radius: borderRadius

    Text {
        text: content
    }

    MouseArea {

        id: buttonAction

        anchors.fill: button
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onClicked: button.clicked()

    }

}