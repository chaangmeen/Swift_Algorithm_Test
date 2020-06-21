////
////  Valid PS _ by Stack.swift
////  alggorithm
////
////  Created by 전창민 on 2020/06/21.
////  Copyright © 2020 min. All rights reserved.
////
//
//import Foundation
//
//private let num = Int(readLine()!)!
//private var arr = [String]()
//for _ in 0..<num {
//    var leftCount = 0
//    var rightCount = 0
//    var flag = true
//
//    let str = readLine()!
//
//    for element in str {
//        if element == ")" {
//            rightCount += 1
//        } else {
//            leftCount += 1
//        }
//
//        if rightCount > leftCount {
//            flag = false
//            break
//        }
//    }
//    if flag && rightCount == leftCount {
//        arr.append("YES")
//    } else {
//        arr.append("NO")
//    }
//}
//
//for i in arr {
//    print(i)
//}
