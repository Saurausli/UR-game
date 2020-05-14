import QtQuick 2.0

Item {
    id:ur
    anchors.fill: parent
    Feld{
        id: spielBrett
        x:0
        y:150
    }
    Wuerfel{
        id:wuerfelPlayer1
        anchors.bottom: spielBrett.top
        anchors.left: spielBrett.left
    }

    Wuerfel{
        id:wuerfelPlayer2
        y:450
    }
}
