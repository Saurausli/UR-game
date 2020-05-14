import QtQuick 2.0
import "JSCode.js" as Logic
Rectangle {
    id:einzelFeld
    property int spielfeldLaenge: 100
    property int feldFunktion: spielFeld.felderFunktion[feldID]
    property int feldID: 0
    property int strassenBreite: spielfeldLaenge*0.15
    property real rand: 0.10
    color: "beige"
    height: spielfeldLaenge
    width: spielfeldLaenge
    x:0
    y:0


    Rectangle{

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
        Rectangle{
            x:-parent.x
            y:(spielfeldLaenge/2)-(strassenBreite/2)-parent.y
            width: spielfeldLaenge*0.5+strassenBreite/2
            height: strassenBreite
            color: "saddlebrown"
            //visible:Logic.checkNeigbourLeft(wegPlayer1)//||Logic.checkNeigbourLeft(wegPlayer2)
            visible: Logic.checkStreetLeft(wegPlayer1,wegPlayer2,einzelFeld.feldID)
        }
        Rectangle{
            x:(spielfeldLaenge/2)-(strassenBreite/2)-parent.x
            y:(spielfeldLaenge/2)-(strassenBreite/2)-parent.y
            width: spielfeldLaenge*0.5+strassenBreite/2
            height: strassenBreite
            color: "saddlebrown"
            //visible: false
            visible:Logic.checkStreetRigth(wegPlayer1,wegPlayer2,einzelFeld.feldID)

        }
        Rectangle{
            x:(spielfeldLaenge/2)-(strassenBreite/2)-parent.x
            y:-parent.y
            width: strassenBreite
            height: (spielfeldLaenge*0.5)+strassenBreite/2
            color: "saddlebrown"
            visible:Logic.checkStreetUp(wegPlayer1,wegPlayer2,einzelFeld.feldID)
        }
        Rectangle{
            x:(spielfeldLaenge/2)-(strassenBreite/2)-parent.x
            y:(spielfeldLaenge/2)-parent.y
            width: strassenBreite
            height: (spielfeldLaenge*0.5)+strassenBreite/2
            color: "saddlebrown"
            visible:Logic.checkStreetDown(wegPlayer1,wegPlayer2,einzelFeld.feldID)
        }

    }

    Text{
        text: einzelFeld.feldID
        anchors.centerIn: einzelFeld.Center

    }


}
