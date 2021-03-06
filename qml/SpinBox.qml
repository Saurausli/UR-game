import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.13
import QtQuick.Controls.Styles 1.4
Item {
    id:spinBox
    property string text: ""
    property int maxValue: 12
    property int minValue: 1
    property int value: input.data
    property int textFeld: 0
    width: 300
    height: 100

    Text {
        id: text
        text: spinBox.text
        color: "black"
        anchors.left: spinBox.left
        font.pixelSize: spinBox.width*0.1
        //anchors.right: plus.right
        visible: if(spinBox.text=="")return false
                else return true
        width: if(textFeld>0) return textFeld
    }
    Button{
        id:plus
        text: "+"
        width:(spinBox.width-text.width)/4
        anchors.left: text.right
        height: spinBox.height

        background: Rectangle{
            anchors.fill: parent
            radius:height*0.05
            color: if(plus.pressed){
                       return "olivedrab"
                   }
                   else{
                       return "olive"
                   }
            Rectangle{
                anchors.fill: parent
                anchors.margins: plus.height*0.1
                radius:plus.radius*0.95
                color: if(plus.pressed){
                           return "goldenrod"
                       }
                       else{
                           return "darkgoldenrod"
                     }

            }
        }
        onClicked: ++spinBox.value
    }
    TextField {
        id:input
        anchors.left: plus.right
        width:(spinBox.width-text.width)/2
        background: Rectangle{
            anchors.fill:parent
            color: "darkgoldenrod"                }

        font.pixelSize: spinBox.height*0.5
        height: spinBox.height
        text: spinBox.value
        validator: IntValidator {bottom: spinBox.minValue; top: spinBox.maxValue   }

            }
    Button{
        id:minus
        text: "-"
        background: Rectangle{
            anchors.fill: parent
            radius:height*0.05
            color: if(minus.pressed){
                       return "olivedrab"
                   }
                   else{
                       return "olive"
                   }
            Rectangle{
                anchors.fill: parent
                anchors.margins: minus.height*0.1
                radius:minus.radius*0.95
                color: if(minus.pressed){
                           return "goldenrod"
                       }
                       else{
                           return "darkgoldenrod"
                     }

            }
        }
        anchors.left: input.right
        anchors.right: spinBox.right
        height: spinBox.height
        width:(spinBox.width-text.width)/4
        onClicked: --spinBox.value
    }
}

