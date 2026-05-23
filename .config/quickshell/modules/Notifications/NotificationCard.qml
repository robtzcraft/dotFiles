
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications

    Rectangle {

        id: root

        required property Notification notif
        signal dismissed()

        width: 346
        //height: 76
        height: contentLayout.implicitHeight + 24
        radius: 16
        color: backgroundColor

        RowLayout {
            id: contentLayout
            anchors { fill: parent; margins: 12 }
            spacing: 10

            Image {

                id: notificationImage

                visible: root.notif.image !== ""
                source: root.notif.image
                Layout.fillWidth: true
                Layout.maximumWidth: 40
                Layout.maximumHeight: 40
                fillMode: Image.PreserveAspectCrop
                Layout.alignment: Qt.AlignVCenter
            }

            // Texto
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 2

                Text {
                    text:  root.notif.summary
                    color: "black"
                    font { pixelSize: 13; bold: true }
                    elide: Text.ElideRight
                    Layout.maximumWidth: (notificationImage.visible)? 200 : 300
                }

                Text {
                    visible:    root.notif.body !== ""
                    anchors.rightMargin: 20
                    text:       root.notif.body
                    color:      "black"
                    font.pixelSize: 12
                    wrapMode:   Text.WordWrap
                    Layout.fillWidth: true
                    maximumLineCount: 2
                    elide: Text.ElideRight
                }
            }

            // Cerrar
            Rectangle {
                width: 20
                height: 20
                radius: 10
                color: "red"
                Layout.alignment: Qt.AlignTop

                Text {
                    text: "x"
                    color: "white"
                    font.pointSize: 10
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        root.notif.dismiss()
                        root.dismissed()
                    }
                }
            }
        }
    }
