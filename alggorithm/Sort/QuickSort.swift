//
//  QuickSort.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/17.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation


// O(nlogn) , 최악의 경우 :정렬된 경우 O(n^2) // space O(n)
func quickSort<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) {
    if lo < hi {
        let pivot = partition(&list, lo: lo, hi: hi)
        quickSort(&list, lo: lo, hi: pivot - 1)
        quickSort(&list, lo: pivot + 1 , hi: hi)
    }
}

// partition 에서 Divide 된 배열 들을 정렬한다.
func partition<T: Comparable> (_ list: inout [T], lo: Int, hi: Int) -> Int{
    
    let pivot = list[hi]
    var i = lo
    
    for j in lo..<hi {
        if list[j] <= pivot {
            list.swapAt(i, j)
            i += 1
        }
    }
    
    list.swapAt(i, hi)
    return i
}



