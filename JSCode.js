var isEqual = function (value, other) {

    // Get the value type
    var type = Object.prototype.toString.call(value);

    // If the two objects are not the same type, return false
    if (type !== Object.prototype.toString.call(other)) return false;

    // If items are not an object or array, return false
    if (['[object Array]', '[object Object]'].indexOf(type) < 0) return false;

    // Compare the length of the length of the two items
    var valueLen = type === '[object Array]' ? value.length : Object.keys(value).length;
    var otherLen = type === '[object Array]' ? other.length : Object.keys(other).length;
    if (valueLen !== otherLen) return false;

    // More tests will go here...

    // If nothing failed, return true
    return true;

};

function checkIdInArray(playerArr, id){

        for(var i=0;i<playerArr.length;i++){
            if(playerArr[i]==id){

                return true
            }
    }
    return false
}
function leeresArray(arrLength){
    var array=[]
    for(var i=0;i<arrLength;i++){
        array[i]=0
    }
    return array
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
    //console.debug(player1)
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


function moeglicherZug(){
    var weg=[]
    var notOnFeld
    var score
    if(playerAnDerReihe==player1.playerId){
        notOnFeld=player1.notOnTheBoard
        weg=player1.way
        score=player1.score
    }
    else{
        notOnFeld=player2.notOnTheBoard
        weg=player2.way
        score=player2.score
    }
    var prof=[]
    prof=Logic.leeresArray(8*3)
    //Startstein
    if(wurf-1>=0&&notOnFeld>0){
        if(playerPos[weg[wurf-1]]!=playerAnDerReihe){
            prof[weg[wurf-1]]=1
        }
    }
    //weiterhüpfen
    var tempBurgJump=false
    for(var j=0;j<weg.length;j++){
        if(felderFunktion[weg[j+wurf]]==burg&&wurf>0&&playerPos[weg[j+wurf]]!=0&&playerPos[weg[j+wurf]]!=playerAnDerReihe){
            wurf++
            burgJump=true
            tempBurgJump=true
        }
        if(playerPos[weg[j+wurf]]!=playerAnDerReihe&&playerPos[weg[j]]==playerAnDerReihe){
            prof[weg[j+wurf]]=1
        }
        if(tempBurgJump){
            tempBurgJump=false
           wurf--
        }
    }
    return prof
}

function platzieren(id){
    var tempPos=[]
    tempPos=playerPos
    var weg=[]

    if(burgJump&&id==felderFunktion.indexOf(burg)+1){
        wurf++
        console.debug("burgjump")

    }
    burgJump=false
    //console.debug(wurf)

    if(playerAnDerReihe==player1.playerId){
        weg=player1.way
    }
    else{
        weg=player2.way
    }

    if(tempPos[id]>0){
        if(playerAnDerReihe==player1.playerId){
            player2.notOnTheBoard++
        }
        if(playerAnDerReihe==player2.playerId){
            player1.notOnTheBoard++
        }
    }

    tempPos[id]=playerAnDerReihe
    console.debug("wurf "+wurf+" "+weg[weg.indexOf(id)]+" new index old :"+weg[weg.indexOf(id)-wurf])

    if(weg[weg.indexOf(id)-wurf]>=0){
      tempPos[weg[weg.indexOf(id)-wurf]]=0
    }
    else{
        if(playerAnDerReihe==player1.playerId){
            player1.notOnTheBoard--
        }
        if(playerAnDerReihe==player2.playerId){
            player2.notOnTheBoard--
        }
    }
    if(id==weg[weg.length-1]){
        tempPos[id]=0
        if(playerAnDerReihe==player1.playerId){
            player1.score++
        }
        if(playerAnDerReihe==player2.playerId){
            player2.score++
        }
    }

    console.debug(isEqual(tempPos,playerPos))
    console.debug(tempPos)
    console.debug(playerPos)
    if(felderFunktion[id]==doppeltZiehen||felderFunktion[id]==burg&&!isEqual(tempPos,playerPos)){
        if(playerAnDerReihe==player1.playerId){
            playerAnDerReihe=player2.playerId
        }
        else{
            playerAnDerReihe=player1.playerId
        }
    }
    playerPos=tempPos
    naechsterZug()
}

function naechsterZug(){

    wurfBereit=true
    posiblePos=leeresArray(xFelder*yFelder)
    if(playerAnDerReihe==player1.playerId){
        playerAnDerReihe=player2.playerId
    }
    else{
        playerAnDerReihe=player1.playerId
    }
}
