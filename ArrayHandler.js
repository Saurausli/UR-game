function leeresArray(arrLength){
    var array=[]
    for(var i=0;i<arrLength;i++){
        array[i]=0
    }
    return array
}
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

function add(arr1,arr2){
    //console.debug(arr1+" + "+arr2)
    var newArr=[]
    if(arr1.length===arr2.length){
        for(var i=0;i<arr1.length;++i){
            newArr[i]=arr1[i]+arr2[i]
        }
    }
    else{
        //console.error("not equal array length "+arr1.length+" != "+arr2.length)
    }

    return newArr
}
