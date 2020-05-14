function checkIdInArray(playerArr, id){
        for(var i=0;i<playerArr.length;i++){
            if(playerArr[i]==id){

                return true
            }
    }
    return false
}
function checkIDNeighbours(array,id1,id2){
    for(var i=1;i<array.length-1;i++){
        if(array[i]==id1&&array[i+1]==id2){
            return true
        }
        if(array[i]==id1&&array[i-1]==id2){
            return true
        }
}
return false
}

function checkStreetRigth(player1,player2, id) {
    var checkArray=[]
    checkArray=player1
    for(var j=0;j<2;j++){
        for(var i=0;i<checkArray.length;i++){
            if(checkIdInArray(checkArray,id)&&checkIdInArray(checkArray,id+1)&&(id+1)%xFelder!=0){
                    return true
                }
            }
    checkArray=player2
    }
 return false
}

function checkStreetLeft(player1,player2, id) {
    var checkArray=[]
    checkArray=player1
    for(var j=0;j<2;j++){
            if(checkIdInArray(checkArray,id)&&checkIdInArray(checkArray,id-1)&&(id)%xFelder!=0){
                    return true
                }
    checkArray=player2
    }
 return false
}
function checkStreetUp(player1,player2, id) {
    var checkArray=[]
    checkArray=player1
    for(var j=0;j<2;j++){
            if(checkIdInArray(checkArray,id)&&checkIdInArray(checkArray,id-xFelder)&&checkIDNeighbours(checkArray,id,id-xFelder)){
                    return true
                }
    checkArray=player2
    }
 return false
}

function checkStreetDown(player1,player2, id) {
    var checkArray=[]
    checkArray=player1
    for(var j=0;j<2;j++){
            if(checkIdInArray(checkArray,id)&&checkIdInArray(checkArray,id+xFelder)&&checkIDNeighbours(checkArray,id,id+xFelder)){
                    return true
                }
    checkArray=player2
    }
 return false
}
