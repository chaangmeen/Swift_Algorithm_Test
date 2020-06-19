//
//  HoareQuickSort.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/17.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation

func hoareQuickSort<T: Comparable> (_ list: inout [T], lo: Int, hi: Int) {
    
    if lo < hi {
        let median = getMedianOfThree(&list, lo: lo, hi: hi)
        let pivot = hoarePartition(&list, lo: lo, hi: hi, median: median)
        
        quickSort(&list, lo: lo, hi: pivot)
        quickSort(&list, lo: pivot + 1, hi: hi)
    }
}

// 마지막에 임의로 정렬상태를 강제로 바꿔줄 수 있다.(정렬이 완전한 상태에서는 n^2 까지 최악 시간 복잡도가 증가할 수 있기 때문)
private func getMedianOfThree<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) -> T {
    
    let center = lo + (hi - lo) / 2
    
    if list[lo] > list[center] {
        list.swapAt(lo, center)
    }
    
    if list[lo] > list[hi] {
        list.swapAt(lo, hi)
    }
    
    if list[center] > list[hi] {
        list.swapAt(center, hi)
    }
    
    list.swapAt(center, hi)
    
    return list[hi]
}


private func hoarePartition<T: Comparable> (_ list: inout [T], lo: Int, hi: Int , median:T) -> Int {
    let pivot = median
    var i = lo - 1
    var j = hi + 1
    
    while true {
        i += 1
        while list[i] < pivot {
            i += 1
        }
        j -= 1
        while list[j] > pivot {
            j -= 1
        }
        if i >= j {
            return j
        }
        list.swapAt(i, j)
    }
}
