//
//  InsertionSort.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/12.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation


public func insertionSort<T: Comparable>(_ list: inout [T]) {

    if list.count <= 1 {
        return
    }

    for i in 1..<list.count {
        let temp = list[i]
        var j = i
        while j > 0 && list[j-1] > temp {
            list[j] = list[j-1]
            j -= 1
        }
        list[j] = temp
    }
    
}



