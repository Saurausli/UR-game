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
    width: 300
    height: 100
    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        height: spinBox.height

        Text {
            id: text
            text: spinBox.text
            color: "black"
            width: 1
            visible: if(spinBox.text=="")return false
                    else return true
        }
        Item {
            Button{
                id:plus
                text: "+"
                width:(spinBox.width-text.width)/3
                anchors.right: input.left
                height: spinBox.height
                onClicked: ++spinBox.value
            }
            TextField {
                id:input
                background: Rectangle{
                width:(spinBox.width-text.width)/3
                    color: "darkgoldenrod"                }
                font.pixelSize: spinBox.height*0.7
                anchors.horizontalCenter: parent.horizontalCenter
                height: spinBox.height
                width: (spinBox.width-text.width)/3
                text: spinBox.value
                validator: IntValidator {bottom: spinBox.minValue; top: spinBox.maxValue   }

                    }
            Button{
                id:minus
                text: "-"
                anchors.left: input.right
                height: spinBox.height
                width:(spinBox.width-text.width)/3
                onClicked: --spinBox.value
            }
        }

    }
}
