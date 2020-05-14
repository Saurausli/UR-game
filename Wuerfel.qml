import QtQuick 2.0
import "JSCode.js" as Logic

Rectangle{
    height: 100
    width: 500
    color: "peru"
    property int wurf: 0

    WuerfelEinzeln{
        id:wuerfel1
        x:30
        y:10

    }
    WuerfelEinzeln{
        id:wuerfel2
        x:110
        y:30

    }
    WuerfelEinzeln{
        id:wuerfel3
        x:220
        y:25

    }
    WuerfelEinzeln{
        id:wuerfel4
        x:320
        y:15

    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            wurf=wuerfel1.wuerfeln()+wuerfel2.wuerfeln()+wuerfel3.wuerfeln()+wuerfel4.wuerfeln()

            wurfBereit=false
            ur.posiblePos=Logic.moeglicherZug()
            if(wurf==0){
                Logic.naechsterZug()
            }

            console.debug(ur.posiblePos)
        }
    }
}
