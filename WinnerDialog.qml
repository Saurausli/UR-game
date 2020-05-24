import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import "JSCode.js" as Logic
Rectangle  {
    id: winner
    width: parent.width*0.8
    height: parent.height*0.8
    radius: parent.height*0.05
    color:  anDerReihe.playerColor

    Rectangle{
        width: parent.width*0.9
        height: parent.height*0.9
        radius: parent.height*0.05
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: "palegoldenrod"
    Column{
        anchors.fill: parent
        spacing: feldLaenge*0.1
        //anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id:winnerText
            text: "Player "+anDerReihe.playerId+" won "
            color: "darkgreen"
            font.bold: true
            font.pixelSize: parent.height*0.1
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            visible: finishWinner
        }
        Text {
            text: player1.score+" : "+player2.score
            color: "black"
            font.bold: true
            font.pixelSize: parent.height*0.05
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            visible: finishWinner
        }
        Text {
            text: "Creat a new Game"
            color: "black"
            font.bold: true
            font.pixelSize: parent.height*0.05
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            visible: !finishWinner
        }
        SpinBox {
               value: startstones
               height: parent.height*0.2
               width: parent.width*0.4
               onValueChanged: {
                   if(value>12){
                       value=12
                   }
                   if(value<1){
                       value=1
                   }
                   startstones=value
               }
               anchors.horizontalCenter: parent.horizontalCenter
           }
        Button {
            text: "Multiplayer local"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width*0.5
            height: parent.height*0.1
            onClicked: {
               Logic.newGame(multiPlayerLocal)

            }
        }
        Button {
            text: "Singelplayer"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width*0.5
            height: parent.height*0.1
            onClicked: {
               Logic.newGame(singelPlayer)
            }
        }
        Button {
            text: "Autoplay"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width*0.5
            height: parent.height*0.1
            onClicked: {
                player1.serie=0
                player2.serie=0
               Logic.newGame(autoPlayer)
            }
        }
        Button {
            text: "Back to Game"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width*0.5
            height: parent.height*0.1
            onClicked: {
               openDialog=false
            }

            visible: gameStarted&&!finishWinner
        }
        Button {
            text: "Algorithmus gewichtung"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width*0.5
            height: parent.height*0.1
            onClicked: {
                openDialog=false
               autoPlayManager.visible=true
            }
        }
        Button {
            text: "Quit"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width*0.5
            height: parent.height*0.1
            onClicked: {
               window.close()
            }
        }

    }
    }
}

