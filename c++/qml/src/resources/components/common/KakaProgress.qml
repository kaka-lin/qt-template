import QtQuick 2.7
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

ProgressBar {
    id: progressBar

    value: 0
    clip: true

    background: Rectangle {
        id: barFrame
        implicitWidth: 300
        implicitHeight: 20
        border.color: "#999999"
        radius: 5
    }

    contentItem: Item {
        id: item
        implicitWidth: 300
        implicitHeight: 18

        Rectangle {
            id: bar
            width: progressBar.visualPosition * parent.width
            height: parent.height
            radius: barFrame.radius

            /*
            Text {
                text: progressBar.value + '%'
                font.pointSize: 12
                font.weight: Font.Bold
                font.bold: true
                color: 'black'
            }
            */
        }

        // 左右漸層顏色(綠 -> 亮綠 -> 綠)
        LinearGradient {
            anchors.fill: bar
            start: Qt.point(0, 0)
            end: Qt.point(bar.width, 0)
            source: bar
            opacity: 0.9

            gradient: Gradient {
                GradientStop { position: 0.0; color: "#17a81a" }
                GradientStop { id: grad; position: 0.5; color: Qt.lighter("#17a81a", 2) }
                GradientStop { position: 1.0; color: "#17a81a" }
            }

            /*
            PropertyAnimation {
                target: grad
                property: "position"
                from: 0.1
                to: 0.9
                duration: 1000
                running: true
                loops: Animation.Infinite
            }
            */

        }

        // 上下漸層顏色
        LinearGradient {
            anchors.fill: bar
            start: Qt.point(0, 0)
            end: Qt.point(0, bar.height)
            source: bar
            opacity: 0.9

            gradient: Gradient {
                GradientStop { position: 0.0; color: Qt.rgba(0,0,0,0) }
                GradientStop { position: 0.5; color: Qt.rgba(1,1,1,0.3) }
                GradientStop { position: 1.0; color: Qt.rgba(0,0,0,0.05) }
            }
        }
    }

    /*
    PropertyAnimation {
        target: progressBar
        property: "value"
        from: 0
        to: 1
        duration: 5000
        running: true
        loops: Animation.Infinite
    }
    */
}
