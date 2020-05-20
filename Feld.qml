import QtQuick 2.0
import "JSCode.js" as Logic
Rectangle {
    id:spielFeld
    property variant spielfeldZustand: []
    property variant xFelderPos:[]/*{
        for(var ix=0;ix<xFelder;++ix){
            for(var iy;iy<yFelder;++iy){

            }
        }*/

    //}

    property variant yFelderPos:[]
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
                    x: xIndex*feldLaenge
                    y: index*feldLaenge
                    feldID:{
                        xFelderPos[(index*xFelder)+xIndex]=x
                        yFelderPos[(index*xFelder)+xIndex]=y
                        return (index*xFelder)+xIndex
                    }
                    spielfeldLaenge: feldLaenge
                    //feldFunktion:doppeltZiehen
                }
            }
        }
    }
}
