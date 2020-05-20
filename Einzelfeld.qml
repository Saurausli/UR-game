import QtQuick 2.11
import "JSCode.js" as Logic
Rectangle {
    id:einzelFeld
    property int spielfeldLaenge: 100
    property int feldFunktion: felderFunktion[feldID]
    property int feldID: 0
    property int strassenBreite: spielfeldLaenge*0.15
    property real rand: 0.10
    color: if(posiblePos[feldID]==0){
                return "beige"
           }
             else{
               //console.debug(posiblePos+" posibel")
                return "lime"
            }
    height: spielfeldLaenge
    width: spielfeldLaenge
    x:0
    y:0
    Rectangle{
        id:rect
        Text {
            anchors.left: parent.left
            anchors.top: parent.top
            text: feldID
            visible: false
        }

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
            visible: Logic.checkStreetLeft(player1.way,player2.way,einzelFeld.feldID)
        }
        Rectangle{
            x:(spielfeldLaenge/2)-(strassenBreite/2)-parent.x
            y:(spielfeldLaenge/2)-(strassenBreite/2)-parent.y
            width: spielfeldLaenge*0.5+strassenBreite/2
            height: strassenBreite
            color: "saddlebrown"
            //visible: false
            visible:Logic.checkStreetRigth(player1.way,player2.way,einzelFeld.feldID)

        }
        Rectangle{
            x:(spielfeldLaenge/2)-(strassenBreite/2)-parent.x
            y:-parent.y
            width: strassenBreite
            height: (spielfeldLaenge*0.5)+strassenBreite/2
            color: "saddlebrown"
            visible:Logic.checkStreetUp(player1.way,player2.way,einzelFeld.feldID)
        }
        Rectangle{
            x:(spielfeldLaenge/2)-(strassenBreite/2)-parent.x
            y:(spielfeldLaenge/2)-parent.y
            width: strassenBreite
            height: (spielfeldLaenge*0.5)+strassenBreite/2
            color: "saddlebrown"
            visible:Logic.checkStreetDown(player1.way,player2.way,einzelFeld.feldID)
        }
        Stone{
            id:stone
            d:spielfeldLaenge*0.6
            //anchors.horizontalCenter: parent.horizontalCenter
            //anchors.verticalCenter: parent.verticalCenter
            property int preX: 100
            property int preY: 10
            x:(rect.width-width)/2
            y:{
                console.debug((rect.height-height)/2)
                return (rect.height-height)/2}
            visible:if(playerPos[feldID]!==0){
                        return true
                    }
                else{
                        return false
                    }
            player:playerPos[feldID]
            states: State {
                    name: "move"
                    when: mouseArea.pressed&&posiblePos[feldID]!=0
                    PropertyChanges { target: stone; x:preX
                        y:preY }
                }
            transitions:[Transition {
                    from: "move"; to: "*"
                    NumberAnimation {
                        properties: "x,y";
                        //easing.type: Easing.InOutQuad;
                        duration: 1000;
                    }
                }
                ]
        }

    }
    MouseArea{
        id:mouseArea
        anchors.fill:parent
        onClicked: {
            if(posiblePos[feldID]!=0){
                var preId
                Logic.platzieren(feldID)
                preId=Logic.getPrePos()
                //stone.preX=xFelderPos[preId]//+((rect.width-stone.width)/2)
                stone.preY=yFelderPos[feldID]-yFelderPos[preId]+((rect.height-stone.height)/2)
                console.debug(preId,stone.preY)
            }
        }
    }
}
