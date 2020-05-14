import QtQuick 2.0
import QtQuick.Shapes 1.10
Item {
    Shape{
        width:20
        height: 20
        ShapePath {
            strokeColor: "black"
            fillColor: "black"
                PathLine { x: 0; y: 0 }
                PathLine { x: 20; y: 0 }
                PathLine { x: 20; y: 20 }
        }
    }
}
