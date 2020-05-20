.import "Algorithmus.js" as Algorithmus
.import "ArrayHandler.js" as Array

function countElements(arr, value) {
    var count=0
    for(var i=0;i<arr.length;i++){
        if(arr[i]===value){
            count++
        }
    }
    //console.debug(arr+" hat x"+count+" "+value)
    return count

}
function checkIdInArray(playerArr, id){

        for(var i=0;i<playerArr.length;i++){
            if(playerArr[i]===id){

                return true
            }
    }
    return false
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
    //console.debug("ermittle moeglichkeiten")
    wurfBereit=false
    var prof=[]
    prof=Array.leeresArray(8*3)
    //Startstein
    if(wurf-1>=0&&anDerReihe.notOnTheBoard>0){
        if(playerPos[anDerReihe.way[wurf-1]]!==anDerReihe.playerId){
            prof[anDerReihe.way[wurf-1]]=1
        }
    }
    //weiterhüpfen
    var tempBurgJump=false
    for(var j=0;j<anDerReihe.way.length;j++){
        var jump=1
        if(felderFunktion[anDerReihe.way[j+wurf]]===burg
                &&wurf>0
                &&playerPos[anDerReihe.way[j+wurf]]===nichtAnDerReihe.playerId){
            wurf++
            jump=2
            burgJump=true
            tempBurgJump=true
        }
        if(playerPos[anDerReihe.way[j+wurf]]!==anDerReihe.playerId&&playerPos[anDerReihe.way[j]]===anDerReihe.playerId){
            prof[anDerReihe.way[j+wurf]]=jump
        }
        if(tempBurgJump){
            tempBurgJump=false
           wurf--
            jump=1
        }
    }
    if(Array.isEqual(prof,Array.leeresArray(prof.length))&&wurf>0){
                naechsterZug()
            }
    return prof
}
function getPrePos(){
    //console.debug(prePlayerPos.length+" === "+playerPos.length)
    if(prePlayerPos.length===playerPos.length){
        for(var i=0;i<prePlayerPos.length;i++){
            //console.debug(prePlayerPos[i]+" ==="+playerPos[i]+" id="+i)
        if(prePlayerPos[i]!==playerPos[i]) return i
        }
    }
    if(anDerReihe.playerID===player1.playerId)return 5
    else return 21
}

function platzieren(id){
    //console.debug("plaziere auf "+id)
    var tempPos=[]
    var prePos=[]
    prePlayerPos=playerPos
    tempPos=playerPos
    prePos=playerPos
    //console.debug("posibil:\t"+posiblePos)

    var weg=[]
    //console.debug("platziere auf "+id+" wurf: "+wurf)
    var tempWurf=posiblePos[id]+wurf-1
    burgJump=false
    //console.debug(wurf)
    weg=anDerReihe.way
    //stein fressen
    if(tempPos[id]===nichtAnDerReihe.playerId){
        nichtAnDerReihe.notOnTheBoard++
    }
    tempPos[id]=anDerReihe.playerId
    //alte position löschen

    if(weg[weg.indexOf(id)-tempWurf]>=0){
        if(felderFunktion[weg[weg.indexOf(id)-tempWurf]]===burg&&tempPos[weg[weg.indexOf(id)-tempWurf]]!==anDerReihe.playerId){
            tempPos[weg[weg.indexOf(id)-tempWurf-1]]=0
        }
        else{
            tempPos[weg[weg.indexOf(id)-tempWurf]]=0
        }
    }

    //neu platzieren
    else{
            //console.debug("new stone")
            anDerReihe.notOnTheBoard--
    }

    //zielbereich
    if(id===weg[weg.length-1]){
        tempPos[id]=0
        anDerReihe.score++
    }
    if(felderFunktion[id]===doppeltZiehen||felderFunktion[id]===burg){
        changePlayer()
    }

    playerPos=tempPos
    posiblePos=Array.leeresArray(xFelder*yFelder)
    //console.debug("player:\t"+playerPos)
    finishWinner=checkForWinner()
    wurf=0
    if(!pause){
        naechsterZug()
    }
    else{
    //console.debug("pause")}
    }

}

function naechsterZug(){
    if(!finishWinner){
        gameBericht+=player1.score+";"+player1.notOnTheBoard+";"+player1.score+";"+player1.notOnTheBoard+"\r\n"
        //console.debug()
        posiblePos=Array.leeresArray(xFelder*yFelder)
        wurfBereit=true
        changePlayer()
        if(!anDerReihe.manuell){
                singelPlayerMove()
        }
    }
    else{
        if(gameMode===autoPlayer&&testCount<tests){
            ++testCount
            //console.debug(testCount+";"+startPlayer+";"+player1.score+";"+player2.score)

            anDerReihe.serie++
            changePlayer()
            newGame(autoPlayer)
        }
        else{
        openDialog=true}
    }


    }
function changePlayer(){
    if(anDerReihe.playerId===player1.playerId){

        ur.player1=ur.anDerReihe
        ur.player2=ur.nichtAnDerReihe
        //console.debug(" 1neu an der Reihe"+anDerReihe.playerId)
        ur.anDerReihe=ur.player2
        ur.nichtAnDerReihe=ur.player1
    }
    else if(anDerReihe.playerId===player2.playerId){
       // console.debug("2 neu an der Reihe "+ anDerReihe.playerId+"  "+ anDerReihe.way+" "+anDerReihe.notOnTheBoard)
        ur.player2=ur.anDerReihe
        ur.player1=ur.nichtAnDerReihe

        ur.anDerReihe=ur.player1
        ur.nichtAnDerReihe=ur.player2

    }

}

function newGame(mode){
    gameMode=mode
    gameBericht=""
    prePlayerPos=Array.leeresArray(xFelder*yFelder)
    playerPos=Array.leeresArray(xFelder*yFelder)
    player1.score=0
    player1.notOnTheBoard=startstones
    player2.score=0
    player2.notOnTheBoard=startstones
    finishWinner=false
    gameStarted=true
    openDialog=false
    //modus spezifische grundeinstellungen
    //gameMode=mode
    if(mode===singelPlayer||mode===autoPlayer){
        player1.manuell=false
    }
    else{
        player1.manuell=true
    }
    if(mode===autoPlayer){
        player2.manuell=false
    }
    else{
        player2.manuell=true
    }

    if((gameMode!==autoPlayer&&Math.floor((Math.random() * 2))+1==1)||(gameMode===autoPlayer&&beginner===player2.playerId)){
        beginner=player1.playerId
        anDerReihe=player1
        nichtAnDerReihe=player2
    }
    else{
        beginner=player2.playerId
        nichtAnDerReihe=player1
        anDerReihe=player2
    }
    startPlayer=anDerReihe.playerId
    //console.debug("start game")
    naechsterZug()
}
function checkForError(){
    var err = false
    var errorMess= "Player "+anDerReihe.playerId+"\n"
    if(countElements(playerPos,anDerReihe.playerId)+anDerReihe.score+anDerReihe.notOnTheBoard!==startstones){
        errorMess+="wrong count: "+countElements(playerPos,anDerReihe.playerId) +" + "+anDerReihe.score+" + "+anDerReihe.notOnTheBoard+" != "+startstones+"\n"
        err=true
    }
    if(err===true){
        console.error(errorMess)
        console.error("Pausiere aufgrund von Error")
        pause=true
    }
}

function checkForWinner(){
    checkForError()
    if(anDerReihe.score===startstones){
        console.debug(gameBericht)
        //console.debug(player1.score+";"+player2.score+";")
        return true
    }
    return false
}

function singelPlayerMove(){
    //console.debug(anDerReihe.playerId+ " wuerfeln Singelplayer")
    if(anDerReihe.playerId===player1.playerId){
        wuerfelPlayer1.wuerfeln()
    }
    else{
        wuerfelPlayer2.wuerfeln()
    }
}
function checkForPossiblities(arr){
        var b=false
        for(var i=0;i<arr.length;i++){
            if(arr[i]!==0){
                b=true
            }
        }
        //console.debug(arr+" "+b)
    return b
}
function setSingelPlayerMove(){
    //console.debug(posiblePos)
    platzieren(Algorithmus.getChoise())
    ur.posiblePos=Array.leeresArray(xFelder*yFelder)
}
