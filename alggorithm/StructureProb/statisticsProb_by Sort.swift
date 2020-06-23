//
//import Foundation
//
//let n = Int(readLine()!)!
//var arr = [Int]()
//var dic = [Int: Int]()
//for _ in 0..<n {
//    let num = Int(readLine()!)!
//    arr.append(num)
//
//    if let v = dic[num] {
//        dic[num] = v + 1
//    } else {
//        dic[num] = 1
//    }
//}
//
//let length = arr.count
//
//let sortArr = arr.sorted{$0 < $1}
//// 평균
//let center = sortArr[length/2]
//let p = Float(arr.reduce(0) { $0 + $1}) / Float(length)
//let average = Int(p.rounded())
//let range = sortArr.last! - sortArr.first!
//
////최빈값
//var third = 0
//let sortDic = dic.sorted{
//    if $0.1 == $1.1 {
//        return $0.0 < $1.0
//    } else {
//        return $0.1 > $1.1
//    }
//}
//
//if sortDic.count == 1  || sortDic[0].value > sortDic[1].value {
//    third = sortDic[0].key
//} else {
//    third = sortDic[1].key
//}
//
//print(average)
//print(center)
//print(third)
//print(range)
