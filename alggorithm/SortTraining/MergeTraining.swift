//
//  MergeTraining.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/18.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation


func mergeSortTest<T: Comparable>(_ list: [T]) -> [T] {
    
    if list.count < 2{
        return list
    }
    
    let center = list.count / 2
    
    return mergeTest(mergeSortTest([T](list[0..<center])), mergeSortTest([T](list[center..<list.count])))
    
}


private func mergeTest<T: Comparable>(_ leftHalf: [T],_ rightHalf: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var list = [T]()
    while leftIndex < leftHalf.count && rightIndex < rightHalf.count {
        
        if leftHalf[leftIndex] > rightHalf[rightIndex] {
            list.append(rightHalf[rightIndex])
            rightIndex += 1
        }
        else if leftHalf[leftIndex] < rightHalf[rightIndex] {
            list.append(leftHalf[leftIndex])
            leftIndex += 1
        }
        else {
            list.append(rightHalf[rightIndex])
            list.append(leftHalf[leftIndex])
            rightIndex += 1
            leftIndex += 1
        }
    }
    
    list += rightHalf[rightIndex..<rightHalf.count]
    list += leftHalf[leftIndex..<leftHalf.count]
    
    
    print("=========in Merge=======")
    print(list)
    return list
}
