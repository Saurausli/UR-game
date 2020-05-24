import QtQuick 2.0
import "JSCode.js" as Logic
import "ArrayHandler.js" as Array
Rectangle{
    id:wuerfel
    property int stones: 0
    property int playerId: 0
    property int individualWurf: 0
    width: 800
    height: 100
    color: if(enabled) return "darkgoldenrod"
            else "palegoldenrod"
    Item{
        id:wuerfelArea
    height:wuerfel.height
    width: wuerfel.width*0.6
        Text {
            x:wuerfel.height*0.1
            y:wuerfel.height*0.1
            text: individualWurf
            font.pixelSize:wuerfel.height*0.3
            font.bold: true
        }
        WuerfelEinzeln{
            id:wuerfel1
            x:wuerfelArea.width*0.3
            y:wuerfelArea.height*0.35
            onFinished: {
                wurf=wuerfel1.value+wuerfel2.value+wuerfel3.value+wuerfel4.value
                individualWurf=wurf
                wurfBereit=false
                ur.posiblePos=Logic.moeglicherZug()
                if(wurf===0||Array.isEqual(posiblePos,Array.leeresArray(posiblePos.length))){
                    //console.debug("wurf ===0|| array leer "+posiblePos)
                    Logic.naechsterZug()
               }
                else if(!anDerReihe.manuell){
                        Logic.setSingelPlayerMove()
                    }
            }
        }
        WuerfelEinzeln{
            id:wuerfel2
            x:wuerfelArea.width*0.45
            y:wuerfelArea.height*0.2

        }
        WuerfelEinzeln{
            id:wuerfel3
            x:wuerfelArea.width*0.6
            y:wuerfelArea.height*0.3

        }
        WuerfelEinzeln{
            id:wuerfel4
            x:wuerfelArea.width*0.75
            y:wuerfelArea.height*0.25

        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
          wuerfeln()
        }
    }
    function wuerfeln(){
        wurf=0
        wuerfel1.wuerfeln()
        wuerfel2.wuerfeln()
        wuerfel3.wuerfeln()
        wuerfel4.wuerfeln()
    }

    NotOnTheBoard{
        id:notOnTheBoard
        playerID: playerId
        anchors.left: wuerfelArea.right
        anchors.top: wuerfelArea.top
        stones:parent.stones
        durchmesser:0.4*feldLaenge
    }
}
