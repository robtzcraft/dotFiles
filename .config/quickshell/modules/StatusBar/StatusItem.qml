
/* ConfigServices is used for colors */
import "../../services";

import QtQuick;

Item {
    id: root;
    property string type: "button";
    property string content: "";
    property int fontSize: 11;
    property var isActive: true;
    readonly property int itemHeight: 19;

    implicitWidth: rect.implicitWidth;
    implicitHeight: rect.implicitHeight;

    Rectangle {
        id: rect;
        implicitWidth: body.childrenRect.width;
        implicitHeight: root.itemHeight;
        color: "transparent";

        Item {
            id: body;
            anchors.centerIn: parent;
            Text {
                anchors.centerIn: parent;
                text: root.content;
                color: root.isActive === true ? ConfigServices.foregroundColor : "#EEEEEE00";
                font.pointSize: root.fontSize;
                font.family: ConfigServices.sansFont;
                font.weight: 600;
            }
        }
    }
}
