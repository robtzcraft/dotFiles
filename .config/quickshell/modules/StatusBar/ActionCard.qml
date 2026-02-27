
import QtQuick
import QtQuick.Controls

Rectangle {

    id: actionCardContainer

    property string content: ""
    property int fontSize: 21
    readonly property string initialFontColor: color_fg0
    readonly property string hoverFontColor: color_blue
    signal clicked()

    color: "transparent"
    implicitWidth: childrenRect.width
    implicitHeight: width

    Text {
        anchors.centerIn: actionCardContainer
        text: content
        font.pointSize: fontSize
        color: actionCardContainerCursorHandler.containsMouse ? hoverFontColor : initialFontColor
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