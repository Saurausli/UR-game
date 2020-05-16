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
        id: titel
        text: player1.score+" :: "+player2.score
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: parent.height*0.8
        font.bold: true
        font.family: "GothicE"
    }
    Stone{
        player: player2.playerId
        d:parent.height*0.6
        anchors.left: titel.right
        anchors.leftMargin: parent.height*0.2
        anchors.verticalCenter: parent.verticalCenter
    }
    ToggelButton{
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: parent.height*0.05
        width:parent.width/8
        textDeToggeld: "fullscreen"
        textToggel: "exit fullscreen"
        onToggeled: {
            window.visibility= "FullScreen"
        }
        onDeToggled: {
            window.visibility = "Windowed"
        }
    }
}