
import QtQuick
import QtQuick.Layouts

Rectangle {

    id: sectionContainer
    
    property int positionX: 0
    property int positionY: 0
    readonly property int internalPadding: 12
    default property alias content: rowLayout.children

    x: positionX
    y: positionY
    implicitWidth: childrenRect.width + ( internalPadding * 2 )
    implicitHeight: parent.height - ( 2 * paddingGlobal )
    color: color_bg0s
    radius: 10

    RowLayout {

        id: rowLayout
        spacing: 10
        anchors.centerIn: parent
    
    }

}