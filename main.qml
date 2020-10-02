import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.0

// Main Window
Window {
    id: windowMenuPrincipal
    visible: true
    width: 800
    height: 600
    color: "#85e3ff"
    title: qsTr("Menu")

    // Makes the window not resizable by the user
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    // Embellishment Layout
    Rectangle {
        id: rectangleMenuPrincipal
        x: parent.width * 0.66875
        y: parent.height * -0.055
        width: parent.width / 2
        height: parent.height / 3
        color: "#1e1559"
        radius: 0
        clip: true
        rotation: 45
        border.width: 1
    } // end Embellishment Layout


    // Logo and Title
    RowLayout {
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20
        transformOrigin: Item.Center

        Image {
            id: logoMenuPrincipal
            Layout.preferredHeight: 157
            Layout.preferredWidth: 170
            fillMode: Image.PreserveAspectFit
            source: "resources/logo.png"
        }

        Text {
            id: txtMenuPrincipal
            text: qsTr("Menu Principal")
            padding: 0
            font.weight: Font.DemiBold
            font.bold: false
            font.family: "Times New Roman"
            font.pixelSize: 55
        }
    } // end Logo and Title


    // Bottom Layout
    RowLayout {
        y: 534
        height: 60
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        Button {
            id: btnArchives
            x: 0
            text: qsTr("Archives")
            transformOrigin: Item.Center
            font.pointSize: 20
        }

        Button {
            id: btnNewBook
            x: 290
            width: 220
            text: qsTr("Nouveau Livre")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: false
            font.pointSize: 20
        }

        ColumnLayout {
            x: 550
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter


            Text {
                id: txtDate
                text: Qt.formatDateTime(new Date(), "dddd dd MMMM yyyy")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredHeight: 30
                Layout.preferredWidth: 220
                font.pixelSize: 15
            }
            Text {
                id: txtTime
                text: internalTimer.currentTime
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredHeight: 30
                Layout.preferredWidth: 75
                font.pixelSize: 15

                Timer {
                    id: internalTimer
                    interval: 1000
                    running: true
                    repeat: true
                    property string currentTime: Qt.formatDateTime(new Date(), "HH:mm:ss")

                    // Make the time display dynamic
                    onTriggered: currentTime = Qt.formatDateTime(new Date(), "HH:mm:ss")
                }
            }
        }
    }

    // end Bottom Layout
} // end Main Window

/*##^##
Designer {
    D{i:2;anchors_x:18;anchors_y:20}D{i:5;anchors_width:769;anchors_x:20}
}
##^##*/
