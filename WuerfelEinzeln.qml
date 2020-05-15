import QtQuick 2.0
import QtQuick.Shapes 1.10

Item {
    property int d: feldLaenge*0.3
    property variant edge: {
        var arr=[]
        for(var i=0;i<2;i++){
            if(Math.floor((Math.random() * 2))+1==1){
                arr[i]=true
            }
            else{
                arr[i]=false
            }
        }
        if(Math.floor((Math.random() * 2))+1==1){
            arr[2]=!arr[0]
            arr[3]=!arr[1]
        }
        else{
            arr[2]=!arr[1]
            arr[3]=!arr[0]
        }
        return arr
    }
    property variant turnAngle:{
            return Math.floor((Math.random() * 360) +1)
        }
    transform:
        Rotation {
        origin.x: d;
        origin.y: d;
        axis { x: 0; y: 0; z: 1 }
        angle: turnAngle
        }
    Shape{
        width:d*2
        height: d*2
        ShapePath {
            strokeColor: "darkslategrey"
            fillColor: "darkslategrey"
            startX: d; startY: d
            PathLine { x: (d+(Math.sin(1.047)*d)); y: (d+Math.cos(1.047)*d) }
            PathLine { x: (d-(Math.sin(1.047)*d)); y: (d+Math.cos(1.047)*d) }
            PathLine { x: d; y: d}
        }
        ShapePath {
            strokeColor: "grey"
            fillColor: "grey"
            startX: d; startY: d
            PathLine { x: (d+(Math.sin(1.047)*d)); y: (d+Math.cos(1.047)*d) }
            PathLine { x: d; y: 0}
            PathLine { x: d; y: d }
        }
        ShapePath {
            strokeColor: "slategray"
            fillColor: "slategray"
            startX: d; startY: d
            PathLine { x: (d-(Math.sin(1.047)*d)); y: (d+Math.cos(1.047)*d) }
            PathLine { x: d; y: 0}
            PathLine { x: d; y: d }
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
        border.width: d/40
        border.color: "black"
    }
    Rectangle{
        width: d/5
        height: d/5
        radius: d/10
        color: "white"
        visible: edge[1]
        x: (d+(Math.sin(1.047)*d))-(height/2)
        y: (d+Math.cos(1.047)*d)-(width/2)
        border.width: d/40
        border.color: "black"
    }
    Rectangle{
        width: d/5
        height: d/5
        radius: d/10
        color: "white"
        visible: edge[2]
        x: (d-(Math.sin(1.047)*d))-(height/2)
        y: (d+Math.cos(1.047)*d)-(width/2)
        border.width: d/40
        border.color: "black"
    }
    Rectangle{
        width: d/5
        height: d/5
        radius: d/10
        color: "white"
        visible: edge[3]
        x: d-(height/2)
        y: 0-(width/2)
        border.width: d/40
        border.color: "black"
    }

    function wuerfeln(){
        var arr=[]
        turnAngle=Math.floor((Math.random() * 360)+turnAngle)
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
