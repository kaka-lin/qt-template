import QtQuick 2.8
import QtQuick.Layouts 1.3

Rectangle {
    id: root
    anchors.fill: parent

    property variant internalModel
    signal rowChanged

    onRowChanged: {
        //listView.positionViewAtEnd();
        listView.positionViewAtIndex(listView.count - 1, ListView.Beginning)
    }

    ListView {
        id: listView
        anchors.fill: parent
        contentWidth: 320
        clip: true

        model: parent.internalModel

        delegate: listDelegate
    }

    Component {
        id: listDelegate

        Rectangle {
            width: root.width
            height: 40
            color: index % 2 == 0 ? "white" : "lightgray"

            GridLayout {
                anchors.fill: parent
                columns: 2
                columnSpacing: (parent.width - itemText.contentWidth - dataText.contentWidth) - 10

                Text {
                    id: itemText
                    text: model.item
                    font.bold: true
                    font.pixelSize: 20
                }

                Text {
                    id: dataText
                    text: model.data
                    font.pixelSize: 20
                    color: "red"
                }
            }
        }
    }

    Component.onCompleted: {
        listView.positionViewAtEnd();
    }
}

