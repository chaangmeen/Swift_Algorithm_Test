
import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let arr = number.compactMap{$0.wholeNumberValue}
    var subK = k
    var stack = [Int]()
    for num in arr {
        while stack.count > 0 && stack.last! < num && subK > 0 {
            stack.popLast()
            subK -= 1
        }
        
        stack.append(num)
    }
    while subK > 0 {
        stack.popLast()
        subK -= 1
    }
    let result = stack.map{String($0)}.joined()
    return result
}

    
//    let arr = number.compactMap{$0.wholeNumberValue}
//    let lenght = arr.count
//    var count = 0
//    var tmpArr = arr
//    var tmpIndex = 0
//    var result = 0
//    while count < k {
//        var tempNumber = 0
//        var number = 0
//        for i in 0..<tmpArr.count {
//            let arr = tmpArr[0..<i] + tmpArr[i+1..<tmpArr.count]
//            tempNumber = Int(arr.reduce(""){$0 + String($1)})!
//            if number < tempNumber || number == 0 {
//                number = tempNumber
//                result = number
//                tmpIndex = i
//            }
//        }
//        count += 1
//        tmpArr.remove(at: tmpIndex)
//    }
    

//solution("4177252841", 4)
