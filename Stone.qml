import QtQuick 2.0

Item {
    property int d: 80
    property real rand: 0.1
    property int player: 0
    width:d
    height:d
    Rectangle{
        anchors.fill: parent
        color: "darkslategray"
        radius: d/2
    Rectangle{
        x:d*rand
        y:d*rand
        color: if(player==1){
                   return player1.playerColor
                  }
                else{
                   return player2.playerColor
               }
        width: d*(1-(rand*2))
        height: d*(1-(rand*2))
        radius: (d*(1-(rand*2)))/2
    }
    }
}
