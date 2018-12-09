# -*- coding: utf-8 -*-

# Resource object code
#
# Created: Sun Dec 9 17:03:20 2018
#      by: The Resource Compiler for PySide2 (Qt v5.11.2)
#
# WARNING! All changes made in this file will be lost!

from PySide2 import QtCore

qt_resource_data = b"\
\x00\x00\x05.\
i\
mport QtQuick 2.\
8\x0aimport QtQuick\
.Layouts 1.3\x0a\x0aRe\
ctangle {\x0a    id\
: root\x0a    ancho\
rs.fill: parent\x0a\
\x0a    property va\
riant internalMo\
del\x0a    signal r\
owChanged\x0a\x0a    o\
nRowChanged: {\x0a \
       //listVie\
w.positionViewAt\
End();\x0a        l\
istView.position\
ViewAtIndex(list\
View.count - 1, \
ListView.Beginni\
ng)\x0a    }\x0a\x0a    L\
istView {\x0a      \
  id: listView\x0a \
       anchors.f\
ill: parent\x0a    \
    contentWidth\
: 320\x0a        cl\
ip: true\x0a\x0a      \
  model: parent.\
internalModel\x0a\x0a \
       delegate:\
 listDelegate\x0a  \
  }\x0a\x0a    Compone\
nt {\x0a        id:\
 listDelegate\x0a\x0a \
       Rectangle\
 {\x0a            w\
idth: root.width\
\x0a            hei\
ght: 40\x0a        \
    color: index\
 % 2 == 0 ? \x22whi\
te\x22 : \x22lightgray\
\x22\x0a\x0a            G\
ridLayout {\x0a    \
            anch\
ors.fill: parent\
\x0a               \
 columns: 2\x0a    \
            colu\
mnSpacing: (pare\
nt.width - itemT\
ext.contentWidth\
 - dataText.cont\
entWidth) - 10\x0a\x0a\
                \
Text {\x0a         \
           id: i\
temText\x0a        \
            text\
: model.item\x0a   \
                \
 font.bold: true\
\x0a               \
     font.pixelS\
ize: 20\x0a        \
        }\x0a\x0a     \
           Text \
{\x0a              \
      id: dataTe\
xt\x0a             \
       text: mod\
el.data\x0a        \
            font\
.pixelSize: 20\x0a \
                \
   color: \x22red\x22\x0a\
                \
}\x0a            }\x0a\
        }\x0a    }\x0a\
\x0a    Component.o\
nCompleted: {\x0a  \
      listView.p\
ositionViewAtEnd\
();\x0a    }\x0a}\x0a\x0a\
\x00\x00\x09!\
i\
mport QtQuick 2.\
7\x0aimport QtQuick\
.Controls 2.2\x0aim\
port QtGraphical\
Effects 1.0\x0a\x0aPro\
gressBar {\x0a    i\
d: progressBar\x0a\x0a\
    value: 0\x0a   \
 clip: true\x0a\x0a   \
 background: Rec\
tangle {\x0a       \
 id: barFrame\x0a  \
      implicitWi\
dth: 300\x0a       \
 implicitHeight:\
 20\x0a        bord\
er.color: \x22#9999\
99\x22\x0a        radi\
us: 5\x0a    }\x0a\x0a   \
 contentItem: It\
em {\x0a        id:\
 item\x0a        im\
plicitWidth: 300\
\x0a        implici\
tHeight: 18\x0a\x0a   \
     Rectangle {\
\x0a            id:\
 bar\x0a           \
 width: progress\
Bar.visualPositi\
on * parent.widt\
h\x0a            he\
ight: parent.hei\
ght\x0a            \
radius: barFrame\
.radius\x0a\x0a       \
     /*\x0a        \
    Text {\x0a     \
           text:\
 progressBar.val\
ue + '%'\x0a       \
         font.po\
intSize: 12\x0a    \
            font\
.weight: Font.Bo\
ld\x0a             \
   font.bold: tr\
ue\x0a             \
   color: 'black\
'\x0a            }\x0a\
            */\x0a \
       }\x0a\x0a      \
  // \xe5\xb7\xa6\xe5\x8f\xb3\xe6\xbc\xb8\xe5\xb1\
\xa4\xe9\xa1\x8f\xe8\x89\xb2(\xe7\xb6\xa0 -> \xe4\
\xba\xae\xe7\xb6\xa0 -> \xe7\xb6\xa0)\x0a  \
      LinearGrad\
ient {\x0a         \
   anchors.fill:\
 bar\x0a           \
 start: Qt.point\
(0, 0)\x0a         \
   end: Qt.point\
(bar.width, 0)\x0a \
           sourc\
e: bar\x0a         \
   opacity: 0.9\x0a\
\x0a            gra\
dient: Gradient \
{\x0a              \
  GradientStop {\
 position: 0.0; \
color: \x22#17a81a\x22\
 }\x0a             \
   GradientStop \
{ id: grad; posi\
tion: 0.5; color\
: Qt.lighter(\x22#1\
7a81a\x22, 2) }\x0a   \
             Gra\
dientStop { posi\
tion: 1.0; color\
: \x22#17a81a\x22 }\x0a  \
          }\x0a\x0a   \
         /*\x0a    \
        Property\
Animation {\x0a    \
            targ\
et: grad\x0a       \
         propert\
y: \x22position\x22\x0a  \
              fr\
om: 0.1\x0a        \
        to: 0.9\x0a\
                \
duration: 1000\x0a \
               r\
unning: true\x0a   \
             loo\
ps: Animation.In\
finite\x0a         \
   }\x0a           \
 */\x0a\x0a        }\x0a\x0a\
        // \xe4\xb8\x8a\xe4\xb8\
\x8b\xe6\xbc\xb8\xe5\xb1\xa4\xe9\xa1\x8f\xe8\x89\xb2\x0a  \
      LinearGrad\
ient {\x0a         \
   anchors.fill:\
 bar\x0a           \
 start: Qt.point\
(0, 0)\x0a         \
   end: Qt.point\
(0, bar.height)\x0a\
            sour\
ce: bar\x0a        \
    opacity: 0.9\
\x0a\x0a            gr\
adient: Gradient\
 {\x0a             \
   GradientStop \
{ position: 0.0;\
 color: Qt.rgba(\
0,0,0,0) }\x0a     \
           Gradi\
entStop { positi\
on: 0.5; color: \
Qt.rgba(1,1,1,0.\
3) }\x0a           \
     GradientSto\
p { position: 1.\
0; color: Qt.rgb\
a(0,0,0,0.05) }\x0a\
            }\x0a  \
      }\x0a    }\x0a\x0a \
   /*\x0a    Proper\
tyAnimation {\x0a  \
      target: pr\
ogressBar\x0a      \
  property: \x22val\
ue\x22\x0a        from\
: 0\x0a        to: \
1\x0a        durati\
on: 5000\x0a       \
 running: true\x0a \
       loops: An\
imation.Infinite\
\x0a    }\x0a    */\x0a}\x0a\
\
\x00\x00\x0e\x0c\
i\
mport QtQuick 2.\
0\x0aimport QtQml 2\
.2\x0a\x0aItem {\x0a    i\
d: root\x0a\x0a    wid\
th: radius * 2\x0a \
   height: radiu\
s * 2\x0a\x0a    prope\
rty int radius: \
100\x0a    property\
 real arcBegin: \
0            // \
start arc angle \
in degree\x0a    pr\
operty real arcE\
nd: 180         \
   // end arc an\
gle in degree\x0a  \
  property real \
arcOffset: 0    \
       // rotati\
on\x0a    property \
real minValue: 0\
\x0a    property re\
al maxValue: 100\
\x0a    property re\
al value: 50\x0a   \
 property string\
 text: \x22%\x22\x0a    p\
roperty bool isV\
alue: true\x0a    p\
roperty bool sho\
wBackground: fal\
se  // a full ci\
rcle as a backgr\
ound of the arc\x0a\
    property rea\
l lineWidth: 20 \
         // widt\
h of the line\x0a  \
  property strin\
g circleColor: \x22\
#1dc58f\x22\x0a    pro\
perty string bac\
kgroundColor: \x22#\
E6E6E6\x22\x0a    prop\
erty string text\
Color: \x22#FFFFFF\x22\
\x0a\x0a    property a\
lias beginAnimat\
ion: animationAr\
cBegin.enabled\x0a \
   property alia\
s endAnimation: \
animationArcEnd.\
enabled\x0a    prop\
erty alias value\
Animation: anima\
tionValue.enable\
d\x0a\x0a    property \
int animationDur\
ation: 200\x0a\x0a    \
onArcBeginChange\
d: canvas.reques\
tPaint()\x0a    onA\
rcEndChanged: ca\
nvas.requestPain\
t()\x0a    onValueC\
hanged: canvas.r\
equestPaint()\x0a\x0a \
   Behavior on a\
rcBegin {\x0a      \
 id: animationAr\
cBegin\x0a       en\
abled: true\x0a    \
   NumberAnimati\
on {\x0a           \
duration: root.a\
nimationDuration\
\x0a           easi\
ng.type: Easing.\
InOutCubic\x0a     \
  }\x0a    }\x0a\x0a    B\
ehavior on arcEn\
d {\x0a       id: a\
nimationArcEnd\x0a \
      enabled: t\
rue\x0a       Numbe\
rAnimation {\x0a   \
        duration\
: root.animation\
Duration\x0a       \
    easing.type:\
 Easing.InOutCub\
ic\x0a       }\x0a    \
}\x0a\x0a    Behavior \
on value {\x0a     \
   id: animation\
Value\x0a        en\
abled: true\x0a    \
    NumberAnimat\
ion {\x0a          \
  duration: root\
.animationDurati\
on\x0a            e\
asing.type: Easi\
ng.InOutCubic\x0a  \
      }\x0a    }\x0a\x0a \
   Canvas {\x0a    \
    id: canvas\x0a \
       anchors.f\
ill: parent\x0a    \
    rotation: -9\
0 + parent.arcOf\
fset\x0a\x0a        on\
Paint: {\x0a       \
     var ctx = g\
etContext(\x222d\x22)\x0a\
            var \
x = root.radius\x0a\
            var \
y = root.radius\x0a\
            var \
angle = (value -\
 minValue) / (ma\
xValue - minValu\
e) * 2 * Math.PI\
\x0a            var\
 start = Math.PI\
 * (parent.arcBe\
gin / 180)\x0a     \
       var end =\
 Math.PI * (pare\
nt.arcEnd / 180)\
\x0a            ctx\
.reset()\x0a\x0a      \
      if (root.i\
sValue) {\x0a      \
          if (ro\
ot.showBackgroun\
d) {\x0a           \
         ctx.beg\
inPath();\x0a      \
              //\
 arc(real x, rea\
l y, real radius\
, real startAngl\
e, real endAngle\
, bool anticlock\
wise)\x0a          \
          ctx.ar\
c(x, y, radius -\
 root.lineWidth \
/ 2, 0, Math.PI \
* 2, false)\x0a    \
                \
ctx.lineWidth = \
root.lineWidth\x0a \
                \
   ctx.strokeSty\
le = root.backgr\
oundColor\x0a      \
              ct\
x.stroke()\x0a     \
           }\x0a   \
             ctx\
.beginPath();\x0a  \
              ct\
x.arc(x, y, radi\
us - root.lineWi\
dth / 2, 0, angl\
e, false)\x0a      \
          ctx.li\
neWidth = root.l\
ineWidth\x0a       \
         ctx.str\
okeStyle = root.\
circleColor\x0a    \
            ctx.\
stroke()\x0a       \
     } else {\x0a  \
              if\
 (root.showBackg\
round) {\x0a       \
             ctx\
.beginPath();\x0a  \
                \
  ctx.arc(x, y, \
radius - root.li\
neWidth / 2, 0, \
Math.PI * 2, fal\
se)\x0a            \
        ctx.line\
Width = root.lin\
eWidth\x0a         \
           ctx.s\
trokeStyle = roo\
t.backgroundColo\
r\x0a              \
      ctx.stroke\
()\x0a             \
   }\x0a           \
     ctx.beginPa\
th();\x0a          \
      ctx.arc(x,\
 y, radius - roo\
t.lineWidth / 2,\
 start, end, fal\
se)\x0a            \
    ctx.lineWidt\
h = root.lineWid\
th\x0a             \
   ctx.strokeSty\
le = root.circle\
Color\x0a          \
      ctx.stroke\
()\x0a            }\
\x0a        }\x0a    }\
\x0a\x0a    Text {\x0a   \
     anchors.cen\
terIn: parent\x0a\x0a \
       text: roo\
t.value + root.t\
ext\x0a        colo\
r: root.textColo\
r\x0a\x0a    }\x0a}\x0a\
\x00\x00\x00\xa5\
m\
odule components\
.common\x0a\x0aCircleP\
rogress 1.0 Circ\
leProgress.qml\x0aC\
lock          1.\
0 Clock.qml\x0aKaka\
Progress   1.0 K\
akaProgress.qml\x0a\
KakaListView   1\
.0 KakaListView.\
qml\x0a\
\x00\x00\x01\xf9\
i\
mport QtQuick 2.\
0\x0a\x0aRectangle {\x0a \
   width: 100\x0a  \
  height: 20\x0a\x0a  \
  property real \
currentTimestamp\
\x0a\x0a    function u\
pdateTime() {\x0a  \
      var now = \
new Date();\x0a    \
    currentTimes\
tamp = now.getTi\
me();\x0a    }\x0a\x0a   \
 Timer {\x0a       \
 interval: 1000\x0a\
        repeat: \
true\x0a        run\
ning: true\x0a     \
   onTriggered: \
{ updateTime(); \
}\x0a    }\x0a\x0a    Tex\
t {\x0a        text\
: Qt.formatTime \
(new Date (curre\
ntTimestamp + (0\
 * 60000)), \x22A h\
h:mm\x22)\x0a        f\
ont.pixelSize: 1\
8\x0a    }\x0a\x0a    Com\
ponent.onComplet\
ed: { updateTime\
(); }\x0a}\x0a\
"

qt_resource_name = b"\
\x00\x0a\
\x07j\x093\
\x00c\
\x00o\x00m\x00p\x00o\x00n\x00e\x00n\x00t\x00s\
\x00\x06\
\x06\xa6D^\
\x00c\
\x00o\x00m\x00m\x00o\x00n\
\x00\x10\
\x03\xbfg\xfc\
\x00K\
\x00a\x00k\x00a\x00L\x00i\x00s\x00t\x00V\x00i\x00e\x00w\x00.\x00q\x00m\x00l\
\x00\x10\
\x00D\x8d|\
\x00K\
\x00a\x00k\x00a\x00P\x00r\x00o\x00g\x00r\x00e\x00s\x00s\x00.\x00q\x00m\x00l\
\x00\x12\
\x0a\xd6\xc5\xbc\
\x00C\
\x00i\x00r\x00c\x00l\x00e\x00P\x00r\x00o\x00g\x00r\x00e\x00s\x00s\x00.\x00q\x00m\
\x00l\
\x00\x06\
\x07\x84+\x02\
\x00q\
\x00m\x00l\x00d\x00i\x00r\
\x00\x09\
\x05\x9e\xc4\x5c\
\x00C\
\x00l\x00o\x00c\x00k\x00.\x00q\x00m\x00l\
"

qt_resource_struct = b"\
\x00\x00\x00\x00\x00\x02\x00\x00\x00\x01\x00\x00\x00\x01\
\x00\x00\x00\x00\x00\x02\x00\x00\x00\x01\x00\x00\x00\x02\
\x00\x00\x00\x1a\x00\x02\x00\x00\x00\x05\x00\x00\x00\x03\
\x00\x00\x00R\x00\x00\x00\x00\x00\x01\x00\x00\x052\
\x00\x00\x00,\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\
\x00\x00\x00\xb4\x00\x00\x00\x00\x00\x01\x00\x00\x1d\x10\
\x00\x00\x00\xa2\x00\x00\x00\x00\x00\x01\x00\x00\x1cg\
\x00\x00\x00x\x00\x00\x00\x00\x00\x01\x00\x00\x0eW\
"

def qInitResources():
    QtCore.qRegisterResourceData(0x01, qt_resource_struct, qt_resource_name, qt_resource_data)

def qCleanupResources():
    QtCore.qUnregisterResourceData(0x01, qt_resource_struct, qt_resource_name, qt_resource_data)

qInitResources()
