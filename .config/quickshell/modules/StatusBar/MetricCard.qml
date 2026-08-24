
import "../../services"

import QtQuick

Rectangle {

    id: metricCardContainer

    property string content: ""
    property int fontSize: 11
    property var isActive: true
    readonly property int itemHeight: 19

    implicitWidth: body.childrenRect.width
    implicitHeight: itemHeight
    color: "transparent"

    Item {
        id: body
        anchors.centerIn: parent
        Text {
            anchors.centerIn: parent
            text: content
            color: isActive === true ? ConfigServices.foregroundColor : "#EEEEEE00"
            font.pointSize: fontSize
            font.family: ConfigServices.sansFont
            font.weight: 600
        }
    }

}
