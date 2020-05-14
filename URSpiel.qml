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
    property int xFelder: 8
    property int yFelder: 3
    property int startstones: 8
    Player{
        id:player1
        playerColor: "maroon"
        playerId:1
        way:[3,2,1,0,8,9,10,11,12,13,14,15,7,6,5]
    }
    Player{
        id:player2
        playerColor: "orange"
        playerId:2
        way:[19,18,17,16,8,9,10,11,12,13,14,15,23,22,21]
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
        enabled: if(playerAnDerReihe==player1.playerId){
                     return true
                 }
                 else{
                     return false
                 }
    }
    NotOnTheBoard{
        anchors.left: wuerfelPlayer1.right
        anchors.top: wuerfelPlayer1.top
        stones:player1.notOnTheBoard
    }
    NotOnTheBoard{
        anchors.left: wuerfelPlayer2.right
        anchors.top: wuerfelPlayer2.top
        stones:player2.notOnTheBoard
    }
    Wuerfel{
        id:wuerfelPlayer2
        y:450
        enabled:if(playerAnDerReihe==player2.playerId){
                             return true
                         }
                         else{
                             return false
                         }
    }
}
