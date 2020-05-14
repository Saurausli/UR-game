import QtQuick 2.0
import QtQuick.Shapes 1.10

Item {
    property int d: 30
    property variant edge: [false,false,false,false]
    Shape{
        width:d*2
        height: d*2

        ShapePath {
            strokeColor: "black"
            fillColor: "black"
            startX: d; startY: 0
            PathLine { x: (d+(Math.sin(1.047)*d)); y: (d+Math.cos(1.047)*d) }
            PathLine { x: (d-(Math.sin(1.047)*d)); y: (d+Math.cos(1.047)*d) }
            PathLine { x: d; y: 0}
        }
    }

    Rectangle{
        width: d/5
        height: d/5
        radius: d/10
        color: "white"
        x: d-(height/2)
        y: d-(width/2)
        visible: edge[0]
    }
    Rectangle{
        width: d/5
        height: d/5
        radius: d/10
        color: "white"
        visible: edge[1]
        x: (d+(Math.sin(1.047)*d))-(height/2)
        y: (d+Math.cos(1.047)*d)-(width/2)
    }
    Rectangle{
        width: d/5
        height: d/5
        radius: d/10
        color: "white"
        visible: edge[2]
        x: (d-(Math.sin(1.047)*d))-(height/2)
        y: (d+Math.cos(1.047)*d)-(width/2)
    }
    Rectangle{
        width: d/5
        height: d/5
        radius: d/10
        color: "white"
        visible: edge[3]
        x: d-(height/2)
        y: 0-(width/2)
    }

    function wuerfeln(){
        var arr=[]
            if(Math.floor((Math.random() * 2))+1==1){
                arr[0]=true
                arr[1]=false
                arr[2]=false
                arr[3]=false
                arr[Math.floor((Math.random() * 3))+1]=true
                edge=arr
                return 1
            }
            else{
                arr[0]=false
                arr[1]=true
                arr[2]=true
                arr[3]=true
                arr[Math.floor((Math.random() * 3))+1]=false
                edge=arr
                return 0
            }
    }
}
