
import "../../services"

import QtQuick
import QtQuick.Controls

Rectangle {

    id: actionCardContainer

    /* Internal variables */
    property string content: ""
    property int fontSize: 20
    property int contentDimensions: 26
    readonly property string initialFontColor: ConfigServices.foregroundColor
    readonly property string hoverFontColor: ConfigServices.onHoverColor
    signal clicked()

    /* Rectangle props */
    color: "transparent"
    implicitWidth: contentDimensions
    implicitHeight: contentDimensions
    radius: 4

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
