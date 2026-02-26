
import QtQuick

Rectangle {

    id: actionCardContainer

    property string content: ""
    property int fontSize: 21
    signal clicked()

    color: "transparent"
    implicitWidth: childrenRect.width
    implicitHeight: width

    Text {
        anchors.centerIn: actionCardContainer
        text: content
        font.pointSize: fontSize
        color: actionCardContainerCursorHandler.containsMouse ? "#8EC07C" : "#FBF1C7"
        Behavior on color { 
            ColorAnimation { duration: 200 } 
        }
    }
    MouseArea {
        id: actionCardContainerCursorHandler
        anchors.fill: actionCardContainer
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onClicked: actionCardContainer.clicked()
    }
}