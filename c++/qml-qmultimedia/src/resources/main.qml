import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtMultimedia 5.9

import "tabs"
import components.common 1.0

ApplicationWindow {
    id: window
    visible: true
    minimumWidth: 640
    minimumHeight: 480

    title: qsTr("Qml Template")

//////////////////////////////////////////////////////////////////////////
// menu
    header: ToolBar {
        id: menu

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 50
            border.color: "#999"

            gradient: Gradient {
                GradientStop { position: 0 ; color: "#fff" }
                GradientStop { position: 1 ; color: "#eee" }
            }
        }

        Row {
            anchors.fill: parent
            spacing: 5

            ToolButton {
                Image {
                    id: newFileImage
                    source: "images/newFile.ico"
                    asynchronous:true
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                }
                anchors.verticalCenter: parent.verticalCenter
                onClicked: fileDialog.open();
            }

            ToolButton {
                Image {
                    id: aboutImage
                    source: "images/about.ico"
                    asynchronous:true
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                }
                anchors.verticalCenter: parent.verticalCenter
                onClicked: aboutBox.open();
            }

            ToolButton {
                Image {
                    id: exitImage
                    source: "images/exit.ico"
                    asynchronous:true
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                }
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    Qt.quit();
                }
            }
        }

        Clock {
            id: clock
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            gradient: Gradient {
                GradientStop { position: 0 ; color: "#fff" }
                GradientStop { position: 1 ; color: "#eee" }
            }
        }
    }

    MessageDialog {
        id: aboutBox
        title: "About"
        text: "
               This is QML Template\n
               Version: 0.1
               Date:2018/10/11"
        icon: StandardIcon.Information
    }

    FileDialog {
        id: fileDialog
        visible: false
        title: "Please choose a file"
        folder: shortcuts.home
        selectFolder: true
    }
//////////////////////////////////////////////////////////////////////////

    Row {
        id: btnRow
        spacing: (parent.width - playBtn.width * 3) / 4

        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            id: playBtn;
            width: 120;
            height: 60;
            text: qsTr("Play")
            onClicked: {
                console.log("clicked play button");
                player.play();
            }
        }

        Button {
            id: pauseBtn;
            width: playBtn.width;
            height: playBtn.height;
            text: qsTr("Pause")
            onClicked: {
                console.log("clicked pause button");
                player.pause();
            }
        }

        Button {
            id: stopBtn;
            width: playBtn.width;
            height: playBtn.height;
            text: qsTr("Stop")
            onClicked: {
                console.log("clicked stop button");
                player.stop();
            }
        }
    }

    Rectangle {
        id: videoArea
        width: parent.width
        height: parent.height - 40

        anchors.top: btnRow.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 20
        anchors.bottomMargin: 20

        VideoOutput {
            source: player
            anchors.fill: parent
            focus : visible // to receive focus and capture key events when visible
        }
    }
}
