
import QtQuick

Rectangle {

    id: metricCardContainer
    
    property string itemData: ""
    property int fontSize: 11
    readonly property int itemHeight: 30

    implicitWidth: childrenRect.width
    implicitHeight: itemHeight
    color: "transparent"

    Text {
        anchors.centerIn: metricCardContainer
        text: itemData
        color: "#FBF1C7"
        font.pointSize: fontSize
        font.family: sansFont
        font.weight: 600
    }
}