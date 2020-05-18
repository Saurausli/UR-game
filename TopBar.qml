//import QtQuick 2.0
import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import Qt.labs.platform 1.1

Item {

    Stone{
        player: player1.playerId
        d:parent.height*0.6
        anchors.right: titel.left
        anchors.rightMargin: parent.height*0.2
        anchors.verticalCenter: parent.verticalCenter
    }
    Text {
        text: player1.serie+" :: "+player2.serie
        anchors.left: parent.left
        font.pixelSize: parent.height*0.6
        font.bold: true
    }
    Text {
        id: titel
        text: player1.score+" :: "+player2.score
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: parent.height*0.8
        font.bold: true
    }
    Stone{
        player: player2.playerId
        d:parent.height*0.6
        anchors.left: titel.right
        anchors.leftMargin: parent.height*0.2
        anchors.verticalCenter: parent.verticalCenter
    }
    ToggelButton{
        id:fullscreen
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: parent.height*0.05
        width:parent.width/8
        textToggel:  "fullscreen"
        textDeToggeld: "exit fullscreen"
        onToggeled: {
            window.visibility= "Windowed"
        }
        onDeToggeled: {
            window.visibility = "FullScreen"
        }
    }
    Button{
        anchors.right: fullscreen.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: parent.height*0.05
        width:parent.width/11
        text: "Home"
        onClicked: {
           openDialog=true
        }
    }

}
