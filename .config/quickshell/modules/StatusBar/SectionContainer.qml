
import "../../services"

import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

Item {

    property int positionX: 0
    property int positionY: 0
    readonly property int internalPadding: 12
    default property alias content: rowLayout.children

    x: positionX
    y: positionY
    implicitWidth: sectionContainer.implicitWidth
    height: parent.height - (2 * ConfigServices.paddingGlobal)

    RectangularShadow {
        anchors.fill: sectionContainer
        offset.x: 0
        offset.y: 0
        radius: sectionContainer.radius
        blur: 6
        spread: 2
        color: Qt.darker(sectionContainer.color, 1.6)
    }

    Rectangle {
        id: sectionContainer
        width: parent.width
        height: parent.height      // Hereda del Item que ya sabe su altura
        implicitWidth: childrenRect.width + (internalPadding * 2)
        color: ConfigServices.backgroundColor
        radius: ConfigServices.radiusMedium

        RowLayout {
            id: rowLayout
            spacing: 10
            anchors.centerIn: parent
        }
    }
}
