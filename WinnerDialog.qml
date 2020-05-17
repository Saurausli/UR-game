import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import "JSCode.js" as Logic
Rectangle  {
    id: winner
    width: parent.width*0.7
    height: parent.height*0.7
    radius: parent.height*0.05
    color: if(playerAnDerReihe==player1.playerId){
               return player1.playerColor
           }
            else{
               return player2.playerColor
           }

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
            text: "Player "+playerAnDerReihe+" won "
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
            height: parent.height*0.2
            onClicked: {
               Logic.newGame()
               finishWinner=false
               openDialog=false
            }
        }
        Button {
            text: "Back to Game"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width*0.5
            height: parent.height*0.2
            onClicked: {
               openDialog=false
            }

            visible: gameStarted
        }
        Button {
            text: "Quit"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width*0.5
            height: parent.height*0.2
            onClicked: {
               window.close()
            }
        }

    }
    }
}

