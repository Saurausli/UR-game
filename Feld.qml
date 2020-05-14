import QtQuick 2.0
import "JSCode.js" as Logic
Rectangle {
    id:spielFeld
    property int feldLaenge: 100

    property variant spielfeldZustand: [8*3]



    width: 8*xFelder
    height: 3*yFelder
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
                    x:xIndex*spielFeld.feldLaenge
                    y:index*spielFeld.feldLaenge
                    feldID:(index*xFelder)+xIndex
                    spielfeldLaenge: spielFeld.feldLaenge
                    //feldFunktion:doppeltZiehen
                }
            }
        }
    }
}
