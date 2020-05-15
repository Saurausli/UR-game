import QtQuick 2.0

Button {
    property bool toggel: false
    property string borderToggelColor:"olivedrab"
    property string textToggelColor: "dimgrey"
    property string colorToggeld: "goldenrod"
    property string textToggel:""
    property string textDeToggeld: ""
    property string borderDeToggelColor: "olive"
    property string textDeToggelColor: "black"
    property string colorDeToggeld: "darkgoldenrod"
    text: if(toggel){
              return textToggel
          }
          else{
                  return textDeToggeld
              }
    color: if(toggel){
               return colorToggeld
           }
           else{
                return colorDeToggeld
               }
    textColor: if(toggel){
               return textToggelColor
           }
           else{
                return textDeToggelColor
               }
    borderColor: if(toggel){
               return borderToggelColor
           }
           else{
                return borderDeToggelColor
               }
    signal toggeled
    signal deToggled

    onClicked: {
        toggel= !toggel
        if(toggel){
            toggeled()
        }
        else{
            deToggled()
        }
    }
}
