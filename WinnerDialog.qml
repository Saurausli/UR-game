import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import "JSCode.js" as Logic
Rectangle  {
    id: winner
    width: feldLaenge*5.5
    height: feldLaenge*3.5
    x: (window.width - width) / 2
    y: (window.height - height) / 2
    color: if(playerAnDerReihe==player1.playerId){
               return player1.playerColor
           }
            else{
               return player2.playerColor
           }

    Rectangle{
        x:10
        y:10
        width: winner.width-20
        height: winner.height-20
        color: "peru"
    }
    Column{
        anchors.fill: parent
        spacing: feldLaenge*0.1
        //anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id:winnerText
            text: "Player "+playerAnDerReihe+" won "
            color: "darkgreen"
            font.bold: true
            font.pixelSize: feldLaenge*0.5
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            text: player1.score+" : "+player2.score
            color: "black"
            font.bold: true
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
        SpinBox {
               value: startstones
               onValueChanged: {
                   startstones=value
               }

               anchors.horizontalCenter: parent.horizontalCenter
           }
        Button {

            text: "new Game"
            anchors.horizontalCenter: parent.horizontalCenter
            width: feldLaenge*1.8
            onClicked: {
               Logic.newGame()
               finishWinner=false
            }

        }
    }
}

