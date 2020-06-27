import Foundation

func solution(clothes:[[String]]) -> Int {
    var result = 1
    var clothDic = [String:[String]]()
    for i in clothes {
        let cloth = i[0]
        let category = i[1]

        if let tmpCategory = clothDic[category] {
            clothDic[category] = tmpCategory + [cloth]
        } else {
            clothDic[category] = [cloth]
        }
    }
    
    for (k,v) in clothDic {
        result *= v.count+1

    }
    
    return result - 1
    
    
    //var s = Set<[String]>()
    
    //countCloth(clothDic: clothDic, selected: [], result: &s)
 
    //return s.count - 1
}

func countCloth(clothDic: [String:[String]], selected: [String] , result: inout Set<[String]>){
    result.insert(selected.sorted(by: >))

    if clothDic.count == 0 {
        return
    }
  
    var tmpDictionary = clothDic
    for (key, clothes) in clothDic {
            for cloth in clothes {
                print("select Cloth: \(cloth)")
                tmpDictionary.removeValue(forKey: key)
                countCloth(clothDic: tmpDictionary, selected: selected + [cloth], result: &result)
                tmpDictionary[key] = clothes
            }
    }
}


//solution(clothes: [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]])

