import QtQuick 2.0
import "JSCode.js" as Logic
import "Algorithmus.js" as Algorithmus
Rectangle {
    id:ur
    width: feldLaenge*xFelder
    height: feldLaenge*(yFelder+2)
    color: "saddlebrown"
    anchors.fill: parent
    property bool pause: false
    property string prePlayerPos
    property int testCount: 0
    property int tests: 100
    property int startPlayer: 0



    property bool wurfBereit: true
    property int wurf: 0
    property bool openDialog: true
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
    property bool gameStarted: false
    property int singelPlayer: 1
    property int multiPlayerLocal: 2
    property int autoPlayer:3
    property int gameMode: 2
    property variant player1: {'playerId':1, 'playerColor':'maroon', 'notOnTheBoard' : startstones,'manuell':true,'score':0,'way':wegPlayer1,'serie':0}
    property variant player2: {'playerId':2, 'playerColor':'orange' , 'notOnTheBoard' : startstones,'manuell':true,'score':0,'way':wegPlayer2,'serie':0}
    property variant anDerReihe:player1
    property variant nichtAnDerReihe:player2
    TopBar{
        id:topBar
        anchors.bottom: spielBrettItem.top
        anchors.top: ur.top
        width: spielBrettItem.width
        anchors.horizontalCenter: ur.horizontalCenter
        enabled: !openDialog
    }
    Item{
        id:spielBrettItem
        anchors.verticalCenter: ur.verticalCenter
        anchors.horizontalCenter: ur.horizontalCenter
        width: feldLaenge*ur.xFelder
        height:feldLaenge*(ur.yFelder+2)
        enabled: !openDialog
        Wuerfel{
            id:wuerfelPlayer1
            anchors.left: spielBrettItem.left
            anchors.right: spielBrettItem.right
            anchors.bottom: spielBrett.top
            anchors.top:spielBrettItem.top
            playerId:player1.playerId
            stones: player1.notOnTheBoard
            enabled: if(anDerReihe.playerId===player1.playerId&&wurfBereit&&player1.manuell){
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
            enabled:if(anDerReihe.playerId===player2.playerId&&wurfBereit&&player2.manuell){
                                 return true
                             }
                             else{
                                 return false
                             }
        }
    }
    WinnerDialog{
        id:winnerDialog
        visible: openDialog||finishWinner
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
    BottomBar{
        id:bottomBar
        anchors.top: spielBrettItem.bottom
        anchors.bottom: ur.bottom
        width: spielBrettItem.width
        enabled: !openDialog
    }

}
