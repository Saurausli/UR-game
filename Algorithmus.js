.import "ArrayHandler.js" as Array
function getChoise(){
    //console.debug("1 "+posiblePos)
    var arr=[]
    var ret
        arr=saveArea(anDerReihe.saveArea)
        arr=Array.add(arr,burg(anDerReihe.burg))
        arr=Array.add(arr,gefahr(anDerReihe.gefahr))
        arr=Array.add(arr,doppelZug(anDerReihe.doppelZug))
        arr=Array.add(arr,fressen(anDerReihe.fressen))
        arr=Array.add(arr,last(anDerReihe.last))
        arr=Array.add(arr,first(anDerReihe.first))
        ret= getMaxPoint(arr)
    //console.debug(arr+"  "+ret)
    return ret
}

function getMaxPoint(arr){
    var j=0
    for(var i=0;i<arr.length;i++){
        if(arr[i]>arr[j]){
            j=i
        }
    }
    return j
}

function getPosWay(){
    var wayPos=[]
    for(var i=0;i<anDerReihe.way.length;i++){
        wayPos[i]=posiblePos[anDerReihe.way[i]]
    }
    return wayPos
}

function first(gewicht) {
    var wayPos=[]
    var returnArr=[]
    returnArr=Array.leeresArray(posiblePos.length)
    wayPos=getPosWay()
        if(wayPos.indexOf(2)>=0){
            returnArr[anDerReihe.way[wayPos.indexOf(2)]]=gewicht
        }
        else if(wayPos.indexOf(1)>=0){
            returnArr[anDerReihe.way[wayPos.indexOf(1)]]=gewicht
        }
    return returnArr
}

function last(gewicht){
    var wayPos=[]
    var returnArr=[]
    returnArr=Array.leeresArray(posiblePos.length)
    wayPos=getPosWay()
        if(wayPos.indexOf(2)>=0){
            returnArr[anDerReihe.way[wayPos.lastIndexOf(2)]]=gewicht
        }

        else if(wayPos.indexOf(1)>=0){
            returnArr[anDerReihe.way[wayPos.lastIndexOf(1)]]=gewicht
        }
    return returnArr
}
function saveArea(gewicht){
    var returnArr=[]
    returnArr=Array.leeresArray(posiblePos.length)
    for(var i=0;i<posiblePos.length;i++){
        if(nichtAnDerReihe.way.indexOf(i)===-1&&posiblePos[i]===anDerReihe.playerId){
           returnArr[i]=gewicht
        }
    }
    return returnArr
}


function burg(gewicht){
    var returnArr=[]
    returnArr=Array.leeresArray(posiblePos.length)
    for(var i=0;i<posiblePos.length;i++){
        if(felderFunktion[i]===burg&&posiblePos[i]===anDerReihe.playerId){
           returnArr[i]=gewicht
        }
    }
    return returnArr
}
function doppelZug(gewicht){
    var returnArr=[]
    returnArr=Array.leeresArray(posiblePos.length)
    for(var i=0;i<posiblePos.length;i++){
        if(felderFunktion[i]===doppeltZiehen&&posiblePos[i]===anDerReihe.playerId){
           returnArr[i]=gewicht
        }
    }
    return returnArr
}
function gefahr(gewicht){
    var moeglicherWurf
    var returnArr=[]
    returnArr=Array.leeresArray(posiblePos.length)
    var kombinationen
    kombinationen=4*4
    for(var i=0;i<playerPos.length;i++){
        if(nichtAnDerReihe.way.indexOf(i)>-1&&anDerReihe.way.indexOf(i)>-1&&playerPos[i]===anDerReihe.playerId){
        for(var m=kombinationen-1;m>=0;m--){
            var m2=m
            //var add=""
            moeglicherWurf=0
            for(var f=0;f<4;++f){
                    moeglicherWurf+=m2%2
                    m2=(m2-(m2%2))/2
            }
            //console.debug(m+" : "+moeglicherWurf+" = "+add)

            if(playerPos[nichtAnDerReihe.way[nichtAnDerReihe.way.indexOf(i)-moeglicherWurf]]===nichtAnDerReihe.playerId){
                if(posiblePos[anDerReihe.way[anDerReihe.way.indexOf(i)+wurf]]>0){
                        //console.debug("achtung bei einem Wurf "+moeglicherWurf+" besteht gefahr")
                        returnArr[anDerReihe.way[anDerReihe.way.indexOf(i)+wurf]]+=gewicht/kombinationen
                    }
                }
            }
        }

    }
    //console.debug(returnArr)
    return returnArr
}

function fressen(gewicht){
    var returnArr=[]
    returnArr=Array.leeresArray(posiblePos.length)
    for(var i=0;i<posiblePos.length;i++){
        if(playerPos[i]===nichtAnDerReihe.playerID&&posiblePos[i]===anDerReihe.playerId){
           returnArr[i]=gewicht
        }
        else if(playerPos[i]===nichtAnDerReihe.playerID&&posiblePos[i]===anDerReihe.playerId){
           returnArr[i]=gewicht/2
        }
    }
    return returnArr
}
