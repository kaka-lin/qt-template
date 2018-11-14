import QtQuick 2.0
import QtQml 2.2

Item {
    id: root

    width: radius * 2
    height: radius * 2

    property int radius: 100
    property real arcBegin: 0            // start arc angle in degree
    property real arcEnd: 180            // end arc angle in degree
    property real arcOffset: 0           // rotation
    property real minValue: 0
    property real maxValue: 100
    property real value: 50
    property string text: "%"
    property bool isValue: true
    property bool showBackground: false  // a full circle as a background of the arc
    property real lineWidth: 20          // width of the line
    property string circleColor: "#1dc58f"
    property string backgroundColor: "#E6E6E6"
    property string textColor: "#FFFFFF"

    property alias beginAnimation: animationArcBegin.enabled
    property alias endAnimation: animationArcEnd.enabled
    property alias valueAnimation: animationValue.enabled

    property int animationDuration: 200

    onArcBeginChanged: canvas.requestPaint()
    onArcEndChanged: canvas.requestPaint()
    onValueChanged: canvas.requestPaint()

    Behavior on arcBegin {
       id: animationArcBegin
       enabled: true
       NumberAnimation {
           duration: root.animationDuration
           easing.type: Easing.InOutCubic
       }
    }

    Behavior on arcEnd {
       id: animationArcEnd
       enabled: true
       NumberAnimation {
           duration: root.animationDuration
           easing.type: Easing.InOutCubic
       }
    }

    Behavior on value {
        id: animationValue
        enabled: true
        NumberAnimation {
            duration: root.animationDuration
            easing.type: Easing.InOutCubic
        }
    }

    Canvas {
        id: canvas
        anchors.fill: parent
        rotation: -90 + parent.arcOffset

        onPaint: {
            var ctx = getContext("2d")
            var x = root.radius
            var y = root.radius
            var angle = (value - minValue) / (maxValue - minValue) * 2 * Math.PI
            var start = Math.PI * (parent.arcBegin / 180)
            var end = Math.PI * (parent.arcEnd / 180)
            ctx.reset()

            if (root.isValue) {
                if (root.showBackground) {
                    ctx.beginPath();
                    // arc(real x, real y, real radius, real startAngle, real endAngle, bool anticlockwise)
                    ctx.arc(x, y, radius - root.lineWidth / 2, 0, Math.PI * 2, false)
                    ctx.lineWidth = root.lineWidth
                    ctx.strokeStyle = root.backgroundColor
                    ctx.stroke()
                }
                ctx.beginPath();
                ctx.arc(x, y, radius - root.lineWidth / 2, 0, angle, false)
                ctx.lineWidth = root.lineWidth
                ctx.strokeStyle = root.circleColor
                ctx.stroke()
            } else {
                if (root.showBackground) {
                    ctx.beginPath();
                    ctx.arc(x, y, radius - root.lineWidth / 2, 0, Math.PI * 2, false)
                    ctx.lineWidth = root.lineWidth
                    ctx.strokeStyle = root.backgroundColor
                    ctx.stroke()
                }
                ctx.beginPath();
                ctx.arc(x, y, radius - root.lineWidth / 2, start, end, false)
                ctx.lineWidth = root.lineWidth
                ctx.strokeStyle = root.circleColor
                ctx.stroke()
            }
        }
    }

    Text {
        anchors.centerIn: parent

        text: root.value + root.text
        color: root.textColor

    }
}
