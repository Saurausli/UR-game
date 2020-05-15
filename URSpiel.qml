import QtQuick 2.0
import "JSCode.js" as Logic
Item {
    id:ur
    anchors.fill: parent
    property int playerAnDerReihe: player1.playerId
    property bool wurfBereit: true
    property int wurf: 0
    property variant playerPos: Logic.leeresArray(8*3)
    property variant posiblePos: Logic.leeresArray(8*3)
    property variant wegPlayer1: [3,2,1,0,8,9,10,11,12,13,14,15,7,6,5]
    property variant wegPlayer2:[19,18,17,16,8,9,10,11,12,13,14,15,23,22,21]
    property variant felderFunktion: [2,1,1,1,0,0,2,1, 1,1,1,3,1,1,1,1 ,2,1,1,1,0,0,2,1]
    property int keinFeld: 0
    property int normalFeld: 1
    property int doppeltZiehen: 2
    property int burg: 3
    property bool burgJump: false
    property int xFelder: 8
    property int yFelder: 3
    property int startstones: 1
    property bool finishWinner: false

    Player{
        id:player1
        playerColor: "maroon"
        playerId:1
        way:wegPlayer1
    }
    Player{
        id:player2
        playerColor: "orange"
        playerId:2
        way:wegPlayer2
    }
    Text {
        id: punktestand
        x:600
        y:10
        font.pixelSize: 20
        text: player1.score+" :: "+player2.score
    }

    Feld{
        id: spielBrett
        x:0
        y:150
    }

    Wuerfel{
        id:wuerfelPlayer1
        anchors.bottom: spielBrett.top
        anchors.left: spielBrett.left
        stones: player1.notOnTheBoard
        enabled: if(playerAnDerReihe==player1.playerId&&wurfBereit){
                     return true
                 }
                 else{
                     return false
                 }
    }
    Wuerfel{
        id:wuerfelPlayer2
        y:450
        stones: player2.notOnTheBoard
        enabled:if(playerAnDerReihe==player2.playerId&&wurfBereit){
                             return true
                         }
                         else{
                             return false
                         }
    }
    WinnerDialog{
        id:winnerDialog
        visible: finishWinner
    }
}
