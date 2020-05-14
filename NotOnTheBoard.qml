import QtQuick 2.0

Rectangle{
    property int stones: 0
    property int playerID: 0
    width: 300
    height: 100
    color: "peru"
    property int durchmesser: 40
    Repeater{
        id:notOnTheBoard1
        model:stones
        Stone{
            d:durchmesser
            y:Math.floor(index/6)*d*1.1
            x:index%6*d*1.1
            player: playerID
        }
    }
}
