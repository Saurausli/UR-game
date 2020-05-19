import QtQuick 2.0

Item {
    id:gewichtung
    property variant player: {'playerId':1, 'playerColor':'maroon',
                                'notOnTheBoard' : startstones,
                                'manuell':true,'score':0,
                                'way':wegPlayer1,'serie':0,
                                'last':100, 'first':0, 'burg':0, 'doppelZug':0,
                                'gefahr':0,'fressen':0,
                                'saveArea':0}
    Column{
        id:column
        y:gewichtung.height*0.1

        property variant temp :{'playerId':1, 'playerColor':'maroon',
            'notOnTheBoard' : startstones,
            'manuell':true,'score':0,
            'way':wegPlayer1,'serie':0,
            'last':100, 'first':0, 'burg':0, 'doppelZug':0,
            'gefahr':0,'fressen':0,
            'saveArea':0}

        SpinBox{
            height: gewichtung.height*0.1
            width: gewichtung.width*0.8
            text: "Burg "
            maxValue: 100
            minValue: 0
            textFeld: width*0.6
            value: gewichtung.player.burg
        }
        SpinBox{
            height: gewichtung.height*0.1
            width: gewichtung.width*0.8
            text: "Doppel Zug "
            maxValue: 100
            minValue: 0
            textFeld: width*0.6
            value: gewichtung.player.doppelZug
        }
        SpinBox{
            height: gewichtung.height*0.1
            width: gewichtung.width*0.8
            text: "fressen "
            maxValue: 100
            minValue: 0
            textFeld: width*0.6
            value: gewichtung.player.fressen
        }
        SpinBox{
            height: gewichtung.height*0.1
            width: gewichtung.width*0.8
            text: "Last "
            maxValue: 100
            minValue: 0
            textFeld: width*0.6
            value: gewichtung.player.last
        }
        SpinBox{
            height: gewichtung.height*0.1
            width: gewichtung.width*0.8
            text: "First "
            maxValue: 100
            minValue: 0
            textFeld: width*0.6
            value: gewichtung.player.first
        }
        SpinBox{
            height: gewichtung.height*0.1
            width: gewichtung.width*0.8
            text: "Gefahr "
            maxValue: 100
            minValue: 0
            textFeld: width*0.6
            value: gewichtung.player.gefahr
        }
        SpinBox{
            height: gewichtung.height*0.1
            width: gewichtung.width*0.8
            text: "saveArea "
            maxValue: 100
            minValue: 0
            textFeld: width*0.6
            value: gewichtung.player.saveArea
        }
    }
}
