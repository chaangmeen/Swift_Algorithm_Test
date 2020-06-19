//
//  MergeSort.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/17.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation


// O(nlogn)
public func mergeSort<T: Comparable> (_ list: [T]) -> [T] {
    
    if list.count < 2 {
        return list
    }
    
    let center = list.count/2
    
    //merge
    return merge(mergeSort([T](list[0..<center])), rightHalf: mergeSort([T](list[center..<list.count])))
}


private func merge<T: Comparable>(_ leftHalf: [T], rightHalf: [T]) -> [T] {
    
    var leftIndex = 0
    var rightIndex = 0
    var tempList = [T]()
    
    while leftIndex < leftHalf.count && rightIndex < rightHalf.count {
        if leftHalf[leftIndex] < rightHalf[rightIndex] {
            tempList.append(leftHalf[leftIndex])
            leftIndex += 1
        } else if leftHalf[leftIndex] > rightHalf[rightIndex] {
            tempList.append(rightHalf[rightIndex])
            rightIndex += 1
        } else {
            tempList.append(rightHalf[rightIndex])
            tempList.append(leftHalf[leftIndex])
            leftIndex += 1
            rightIndex += 1
        }
    }
    
    tempList += [T](rightHalf[rightIndex..<rightHalf.count])
    tempList += [T](leftHalf[leftIndex..<leftHalf.count])
    
    return tempList
}
