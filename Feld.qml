import QtQuick 2.0
import "JSCode.js" as Logic
Rectangle {
    id:spielFeld
    property variant spielfeldZustand: [8*3]
    width: feldLaenge*xFelder
    height: feldLaenge*yFelder
    color:"red"
    Repeater{
        id:xRepeater
        model: xFelder
        Item{
           property int xIndex: index
           Repeater{
                id:yRepeater
                model: yFelder
                Einzelfeld{
                    x:xIndex*feldLaenge
                    y:index*feldLaenge
                    feldID:(index*xFelder)+xIndex
                    spielfeldLaenge: feldLaenge
                    //feldFunktion:doppeltZiehen
                }
            }
        }
    }
}
