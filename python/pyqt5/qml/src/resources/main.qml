import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

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
// footer

    footer: TabBar {
        id: tabBar
        width: parent.width
        height: 40
        currentIndex: 0

        TabButton {
            text: qsTr("Tab1")
            onClicked: {
                //
            }
        }

        TabButton {
            text: qsTr("Tab2")
            onClicked: {
                //
            }
        }
    }

    StackLayout {
        id: layout
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Tab1 {
            id: aTab
        }

        Tab2 {
            id: bTab
        }
    }
}
