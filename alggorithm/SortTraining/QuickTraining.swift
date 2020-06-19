//
//  QuickTraining.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/18.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation


func quickSortTest<T: Comparable>(_ list: inout [T], lo: Int, hi: Int)  {

    if lo < hi {
        let pivot = partitionTest(&list, lo: lo, hi: hi)
        quickSortTest(&list, lo: lo, hi: pivot-1)
        quickSortTest(&list, lo: pivot+1, hi: hi)
    }
}


func partitionTest<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) -> Int {
    
    var pivot = hi
    var wall = lo
    var left = lo
    
    while left < pivot {
        if list[left] <= list[pivot] {
            list.swapAt(left, wall)
            wall += 1
        }
        left += 1
    }
    
    list.swapAt(wall, pivot)
    pivot = wall
    return pivot
}
