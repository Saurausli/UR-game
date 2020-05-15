//import QtQuick 2.0
import QtQuick 2.0
import QtQuick.Controls 2.14
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import Qt.labs.platform 1.1

Item {
    Text {
        id: titel
        text: "THE UR GAME"
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: parent.height*0.8
        font.bold: true
        font.family: "GothicE"
    }
    ToggelButton{
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: parent.height*0.05
        width:parent.width/8
        textDeToggeld: "fullscreen"
        textToggel: "exit fullscreen"
        onToggeled: {
            window.visibility= "FullScreen"
        }
        onDeToggled: {
            window.visibility = "Windowed"
        }
    }
}
