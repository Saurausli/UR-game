import QtQuick 2.12
import QtQuick.Window 2.12
import "JSCode.js" as Logic

Window {
    id:window
    visible: true
    property int feldLaenge: if(width/8<height/6){
                                 return width/8
                             }
                             else{
                                 return height/6
                             }

    width: 800
    height:600
    title: qsTr("UR Schach")
    URSpiel{
        id:urgame
        anchors.fill: parent
    }
}
