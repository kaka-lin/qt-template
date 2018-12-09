import QtQuick 2.0

Rectangle {
    width: 100
    height: 20

    property real currentTimestamp

    function updateTime() {
        var now = new Date();
        currentTimestamp = now.getTime();
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: { updateTime(); }
    }

    Text {
        text: Qt.formatTime (new Date (currentTimestamp + (0 * 60000)), "A hh:mm")
        font.pixelSize: 18
    }

    Component.onCompleted: { updateTime(); }
}
