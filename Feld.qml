import QtQuick 2.0
import "JSCode.js" as Logic
Rectangle {
    id:spielFeld
    property int feldLaenge: 100
    property int xFelder: 8
    property int yFelder: 3
    property variant spielfeldZustand: [8*3]
    property variant felderFunktion: [2,1,1,1,0,0,2,1, 1,1,1,3,1,1,1,1 ,2,1,1,1,0,0,2,1]
    property int keinFeld: 0
    property int normalFeld: 1
    property int doppeltZiehen: 2
    property int burg: 3
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
                    spielfeldLaenge: spielFeld.feldLaenge
                    feldFunktion:spielFeld.felderFunktion[(index*xFelder)+xIndex]
                    //feldFunktion:doppeltZiehen
                }
            }
        }
    }
}
