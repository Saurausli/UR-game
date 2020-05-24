import QtQuick.Shapes 1.10
import QtQuick 2.13

Item {
    id:item
    width: 100
    height: 100
    Shape {
        anchors.fill: parent
        ShapePath{
        startX: 0; startY:  item.height
        strokeColor: "black"
        strokeWidth: item.width*0.075
        fillColor: "transparent"
        PathArc {
            x: item.width; y: item.height
            radiusX:  item.width*0.7; radiusY:  item.height*0.7
            useLargeArc: true
        }
        PathLine { x: 0; y: item.height }
        }
    }
    Shape{
        id:top
        width:item.width*0.25
        height: item.height*0.5
        x:  item.width*0.35
        y: 0
        ShapePath{
            strokeColor: "black"
            fillColor: "black"
            startX:  0
            startY: top.height
            PathLine { x: item.width*0.4-top.x; y: item.height*0.3 }
            PathLine { x: item.width*0.5-top.x; y: item.height*0.2 }
            PathLine { x: item.width*0.6-top.x; y: item.height*0.25 }
            PathLine { x: item.width*0.7-top.x; y: item.height*0.5 }

        }
        transformOrigin: Shape.BottomLeft
        RotationAnimator on rotation {
                id:animation
                from: 0;
                to: -120;
                duration: 2000
                running: false
            }
    }
    function turn(){
        animation.running=true
    }

    Shape{
        width:parent.width
        height: parent.width
        ShapePath {
            strokeColor: "black"
            fillColor: "black"
            startX:  0
            startY: item.height
            PathLine { x: item.width*0.1; y: item.height*0.9 }
            PathLine { x: item.width*0.22; y: item.height*0.85 }
            PathLine { x: item.width*0.25; y: item.height*0.82 }
            PathLine { x: item.width*0.27; y: item.height*0.8 }
            PathLine { x: item.width*0.3; y: item.height*0.71 }
            PathLine { x: item.width*0.31; y: item.height*0.65 }
            PathLine { x: item.width*0.32; y: item.height*0.64 }
            PathLine { x: item.width*0.35; y: item.height*0.5 }

            PathLine { x: item.width*0.7; y: item.height*0.5 }

            PathLine { x: item.width*0.75; y: item.height*0.75 }
            PathLine { x: item.width*0.85; y: item.height*0.75 }
            PathLine { x: item.width*0.87; y: item.height*0.8 }
            PathLine { x: item.width*0.95; y: item.height*0.9 }
            PathLine { x: item.width; y: item.height}
            PathLine { x: 0; y: item.height}
        }
    }
}
