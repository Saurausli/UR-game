import QtQuick 2.0

Rectangle {
    anchors.fill: parent
    SaurausliLogo{
        width:parent.height*0.3
        height:parent.height*0.3
        anchors.bottom: name.top
        anchors.margins:{
            turn()
            return parent.height*0.01}
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id:name
        text: "Saurauslis Game Studio"
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: parent.height*0.05

        anchors.bottom: presents.top
        anchors.margins: parent.height*0.01
    }
    Text {
        id: presents
        text: "presents"
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: parent.height*0.04

        anchors.bottom: gamename.top
        anchors.margins: parent.height*0.01
    }
    Text {
        id:gamename
        text: "THE GAME OF UR"
        font.pixelSize: parent.height*0.1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: parent.height*0.2
        anchors.verticalCenter: parent.verticalCenter
    }
    color: "darkgoldenrod"
    MouseArea{
        anchors.fill: parent
        onClicked: {
            startScreen.visible=false
            urgame.visible=true
        }
    }
}
