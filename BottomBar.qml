import QtQuick 2.0
import "JSCode.js" as Logic
Item {
    id:bottomBar
    ToggelButton{
        id:pause
        width: bottomBar.width*0.2
        height: bottomBar.height*0.8
        text: "pause"
        anchors.horizontalCenter: bottomBar.horizontalCenter
        anchors.right: bottomBar.right
        onToggeled: {
            console.debug("pause Button")
            ur.pause=true
        }
        onDeToggeled: {

            ur.pause=false
            Logic.naechsterZug()}
    }
}
