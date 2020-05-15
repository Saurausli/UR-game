import QtQuick 2.0
import QtQuick.Controls 2.14
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import "JSCode.js" as Logic
Dialog  {
    id: winner
    width: 200
    height: 180
    x: (window.width - width) / 2
    y: (window.height - height) / 2
    background:Rectangle{
        id: back
        width: winner.width
        height: winner.height
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
            color: "white"
        }
    }
        Column{
            anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id:winnerText
            text: "Player "+playerAnDerReihe+" won "
            color: "darkgreen"
            font.bold: true
            font.pixelSize: 20
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
        Button {

            text: "new Game"
            anchors.horizontalCenter: parent.horizontalCenter
            /*style:ButtonStyle{
                background: Rectangle{
                    color: "beige"
                }


            }*/
           onClicked: {
               Logic.newGame()
               winner.close()
           }
        }
        }
    }

