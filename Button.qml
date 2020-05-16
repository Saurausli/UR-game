import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
MouseArea {
    id:button
    width: 100
    height: 80
    property string text: "button"

    property string textColor: "black"
    property string textPressedColor: "dimgrey"
    property string color: "darkgoldenrod"
    property string pressedColor: "goldenrod"
    property string borderColor: "olive"
    property string borderPressedColor: "olivedrab"
    property string fontFamily: "Footlight MT"
    property int pixelSize: height*0.3
    property bool bold: false
    property int radius: 5
    Rectangle{
        anchors.fill: parent
        radius:button.radius
        color: if(button.pressed){
                   return button.borderPressedColor
               }
               else{
                   return button.borderPressedColor
               }
        Rectangle{
            anchors.fill: parent
            anchors.margins: button.width*0.05
            radius:button.radius*0.95
            color: if(button.pressed){
                       return button.pressedColor
                   }
                   else{
                       return button.color
                   }
            Text {
                id: name
                text: button.text
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                color:if(button.pressed){
                          return button.textPressedColor
                      }
                      else{
                          return button.textColor
                      }
                font.bold: button.bold
                font.pixelSize: button.pixelSize
                font.family: fontFamily
            }
        }
    }
}
