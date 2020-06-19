//
//  BubbleSort.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/18.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation


// 시간복잡도 O(n^2) 스와핑을 위한 공간 O(1)필요 
func bubbleSort<T: Comparable> (_ list: inout [T]) {
    
    if list.count < 2 {
        return
    }
    
    // n-1 번 순회 한다. 마지막 숫자가 제일 앞자리로 오기에 필요한 횟수
    for _ in 1..<list.count {
        for j in 0..<list.count-1 {
            if list[j] > list[j+1] {
                list.swapAt(j, j+1)
            }
        }
    }
    
    return 
}
