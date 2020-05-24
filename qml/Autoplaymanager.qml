import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3

Rectangle {
    id: autoManager
    width: parent.width*0.8
    height: parent.height*0.8
    radius: parent.height*0.05
    color:  anDerReihe.playerColor
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    Rectangle{
        width: parent.width*0.9
        height: parent.height*0.9
        radius: parent.height*0.05
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: "palegoldenrod"
        Column{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Text {
                text: "Algorithmus Gewichtung"
                font.bold: true
                font.pixelSize: autoManager.height*0.05
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Row{
               Gewichtungen{
                   width:autoManager.width*0.4
                   height: autoManager.height*0.7
                   player:player1
               }
               Gewichtungen{
                   width:autoManager.width*0.4
                   height: autoManager.height*0.7
                   player:player2
               }
            }
            Button{
                text: "back"
                height: autoManager.height*0.1
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    var temp
                    temp=player1
                    player1=temp
                    temp=player2
                    player2=temp
                    autoManager.visible=false
                    openDialog=true
                }
            }
        }
    }
}
