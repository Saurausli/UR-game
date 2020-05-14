import QtQuick 2.0

Rectangle {
    id:einzelFeld
    property int spielfeldLaenge: 100
    property int feldFunktion: 0
    color: "beige"
    height: spielfeldLaenge
    width: spielfeldLaenge
    x:0
    y:0
    Rectangle{
        property real rand: 0.10
        x: einzelFeld.spielfeldLaenge*rand
        y: einzelFeld.spielfeldLaenge*rand

        height: spielfeldLaenge*(1-(rand*2))
        width: spielfeldLaenge*(1-(rand*2))
        visible: if(feldFunktion==keinFeld){
                    return false
                 }
                else{
                     return true
                 }
        color:  if(feldFunktion==normalFeld)
                    return "darkgreen"
                else if(feldFunktion==doppeltZiehen)
                   return "darkgoldenrod"
                else if(feldFunktion==burg)
                   return "darkgray"
                else{
                   return "red"
               }
    }


}
