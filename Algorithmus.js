
function getPosWay(){
    var wayPos=[]
    for(var i=0;i<anDerReihe.way.length;i++){
        wayPos[i]=posiblePos[anDerReihe.way[i]]
    }
    //console.debug(wayPos)
    //console.debug(anDerReihe.way)
    //console.debug(posiblePos)
    //console.debug()
    return wayPos
}

function first() {
    //console.debug("f set to "+posiblePos+" "+posiblePos.indexOf(1)+"||"+posiblePos.indexOf(2))
    var wayPos=[]
    wayPos=getPosWay()
    if(wayPos.indexOf(2)>=0) return anDerReihe.way[wayPos.indexOf(2)]
    else return anDerReihe.way[wayPos.indexOf(1)]
}

function last(){
    //console.debug("l set to "+posiblePos+"  "+posiblePos.lastIndexOf(1)+"||"+posiblePos.lastIndexOf(2))
    var wayPos=[]
    wayPos=getPosWay()
    if(wayPos.lastIndexOf(2)>=0) return anDerReihe.way[wayPos.lastIndexOf(2)]
    else return anDerReihe.way[wayPos.lastIndexOf(1)]
}
