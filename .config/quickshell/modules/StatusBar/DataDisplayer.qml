
import QtQuick
import QtQuick.Layouts

Rectangle {

    id: dataDisplayerContainer
    
    property string itemData: ""
    property int itemHeight: 30

    implicitWidth: childrenRect.width
    implicitHeight: itemHeight
    color: "transparent"

    Text {
        anchors.centerIn: dataDisplayerContainer
        text: itemData
        color: "#D5C4A1"
        font.pointSize: 12
        font.family: sansFont
        font.weight: 600
    }
}