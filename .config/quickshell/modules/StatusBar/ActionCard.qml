
import "../../services"

import QtQuick
import QtQuick.Controls

Rectangle {
    id: actionCardContainer

    /* Propiedades públicas e internas */
    property string content: ""
    property string tooltipText: ""
    property int fontSize: 20
    property int contentDimensions: 26
    readonly property string initialFontColor: ConfigServices.foregroundColor
    readonly property string hoverFontColor: ConfigServices.onHoverColor
    signal clicked()

    /* Propiedades del contenedor base */
    color: "transparent"
    implicitWidth: contentDimensions
    implicitHeight: contentDimensions
    radius: 4

    Text {
        anchors.centerIn: actionCardContainer
        text: actionCardContainer.content
        font.pointSize: actionCardContainer.fontSize
        color: actionCardContainerCursorHandler.containsMouse ? hoverFontColor : initialFontColor
        Behavior on color { 
            ColorAnimation { duration: 180 } 
        } 
    }
    
    MouseArea {
        id: actionCardContainerCursorHandler
        anchors.fill: actionCardContainer
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onClicked: actionCardContainer.clicked()
    }

    /* ToolTip estilo macOS posicionado correctamente abajo */
    ToolTip {
        id: customTooltip
        parent: actionCardContainer
        visible: actionCardContainer.tooltipText !== "" && actionCardContainerCursorHandler.containsMouse
        delay: 300

        // Centrado en X y desplazado 12px por debajo del borde inferior del ActionCard
        x: (actionCardContainer.width - implicitWidth) / 2
        y: actionCardContainer.height + 12

        // Animación de entrada/salida (Scale + Opacity)
        enter: Transition {
            NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; duration: 160; easing.type: Easing.OutCubic }
            NumberAnimation { property: "scale"; from: 0.92; to: 1.0; duration: 160; easing.type: Easing.OutCubic }
        }
        exit: Transition {
            NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; duration: 100; easing.type: Easing.InCubic }
            NumberAnimation { property: "scale"; from: 1.0; to: 0.95; duration: 100; easing.type: Easing.InCubic }
        }

        // Fondo semi-transparente estilo macOS
        background: Rectangle {
            color: Qt.rgba(0.12, 0.12, 0.12, 0.90)
            radius: 6
            border.color: Qt.rgba(1, 1, 1, 0.15)
            border.width: 1
        }

        contentItem: Text {
            text: actionCardContainer.tooltipText
            color: "#FFFFFF"
            font.family: ConfigServices.sansFont
            font.pointSize: 9
            font.weight: Font.Medium
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
