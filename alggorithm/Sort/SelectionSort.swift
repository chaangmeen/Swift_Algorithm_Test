//
//  SelectionSort.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/18.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation


// 시간 복잡도 O(n^2)
func selectionSort<T: Comparable>(_ list: inout [T]) {
    
    if list.count < 2 {
        return
    }
    
    for i in 0..<list.count {
        
        var j = i + 1
        var minIndex = i
        while j < list.count {
            if list[minIndex] > list[j] {
                minIndex = j
            }
            j += 1
        }
        
        if minIndex != i {
            list.swapAt(minIndex, i)
        }
    }
    
}
