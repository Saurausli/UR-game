function isEqual(value, other) {
    if(value.length!==other.length){
        return false
    }
    for(var i=0;i<value.length;i++){
        if(value[i]!==other[i]){
            return false
        }
    }
    return true

}

function checkIdInArray(playerArr, id){

        for(var i=0;i<playerArr.length;i++){
            if(playerArr[i]===id){

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
        if(array[i]===id1&&array[i+1]===id2){
            return true
        }
        if(array[i]===id1&&array[i-1]===id2){
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
    wurfBereit=false
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
        if(playerPos[weg[wurf-1]]!==playerAnDerReihe){
            prof[weg[wurf-1]]=1
        }
    }
    //weiterhüpfen
    var tempBurgJump=false
    for(var j=0;j<weg.length;j++){
        if(felderFunktion[weg[j+wurf]]===burg&&wurf>0&&playerPos[weg[j+wurf]]!==0&&playerPos[weg[j+wurf]]!==playerAnDerReihe){
            wurf++
            burgJump=true
            tempBurgJump=true
        }
        if(playerPos[weg[j+wurf]]!==playerAnDerReihe&&playerPos[weg[j]]===playerAnDerReihe){
            prof[weg[j+wurf]]=1
        }
        if(tempBurgJump){
            tempBurgJump=false
           wurf--
        }
    }
    if(isEqual(prof,leeresArray(prof.length))&&wurf>0){
                naechsterZug()
            }
    return prof
}

function platzieren(id){
    var tempPos=[]
    var prePos=[]
    tempPos=playerPos
    prePos=playerPos
    var weg=[]

    if(burgJump&&id===felderFunktion.indexOf(burg)+1){
        wurf++
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
    if(id===weg[weg.length-1]){
        tempPos[id]=0
        if(playerAnDerReihe==player1.playerId){
            player1.score++
        }
        if(playerAnDerReihe==player2.playerId){
            player2.score++
        }
    }
    finishWinner=checkForWinner()
    if(felderFunktion[id]===doppeltZiehen||felderFunktion[id]===burg){
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
    posiblePos=leeresArray(xFelder*yFelder)
        wurfBereit=true
        if(playerAnDerReihe==player1.playerId){
            playerAnDerReihe=player2.playerId
        }
        else{
            playerAnDerReihe=player1.playerId
        }
}

function newGame(){
    playerAnDerReihe=Math.floor((Math.random() * 2))+1
    playerPos=leeresArray(xFelder*yFelder)
    player1.score=0
    player1.notOnTheBoard=startstones
    player2.score=0
    player2.notOnTheBoard=startstones
    finishWinner=false
    gameStarted=true
    naechsterZug()
}
function checkForWinner(){
    if(player1.score==startstones||player2.score==startstones){
        return true
    }
    return false
}
