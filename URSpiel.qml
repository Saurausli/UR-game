import QtQuick 2.0
import "JSCode.js" as Logic
Rectangle {
    id:ur
    width: feldLaenge*xFelder
    height: feldLaenge*(yFelder+2)
    color: "saddlebrown"
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
    property int startstones: 7
    property bool finishWinner: false
    TopBar{
        id:topBar
        anchors.bottom: spielBrettItem.top
        anchors.top: ur.top
        width: spielBrettItem.width
        anchors.horizontalCenter: ur.horizontalCenter
    }
    Item{
        id:spielBrettItem
        anchors.verticalCenter: ur.verticalCenter
        anchors.horizontalCenter: ur.horizontalCenter
        width: feldLaenge*ur.xFelder
        height:feldLaenge*(ur.yFelder+2)

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
        Wuerfel{
            id:wuerfelPlayer1
            anchors.left: spielBrettItem.left
            anchors.right: spielBrettItem.right
            anchors.bottom: spielBrett.top
            anchors.top:spielBrettItem.top
            playerId:player1.playerId
            stones: player1.notOnTheBoard
            enabled: if(playerAnDerReihe==player1.playerId&&wurfBereit){
                         return true
                     }
                     else{
                         return false
                     }
        }
        Feld{
            id: spielBrett
            y:(spielBrettItem.height-spielBrett.height)/2
            anchors.verticalCenter: spielBrettItem.verticalCenter
            anchors.horizontalCenter: spielBrettItem.horizontalCenter
        }
        Wuerfel{
            id:wuerfelPlayer2
            anchors.left: spielBrettItem.left
            anchors.right: spielBrettItem.right
            anchors.bottom: spielBrettItem.bottom
            anchors.top:spielBrett.bottom
            playerId:player2.playerId
            stones: player2.notOnTheBoard
            enabled:if(playerAnDerReihe==player2.playerId&&wurfBereit){
                                 return true
                             }
                             else{
                                 return false
                             }
        }
    }
    WinnerDialog{
        id:winnerDialog
        visible: finishWinner
    }
    BottomBar{
        id:bottomBar
        anchors.top: spielBrettItem.bottom
        anchors.bottom: ur.bottom
        anchors.horizontalCenter: ur.horizontalCenter
        width: spielBrettItem.width
    }

}
