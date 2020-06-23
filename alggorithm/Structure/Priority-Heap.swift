//
//  PriorityQueue-1.swift
//  alggorithm
//
//  Created by 전창민 on 2020/06/21.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation


public class Heap {
    
    private var heap : [Int?] = [nil]
    private let ordered: (Int,Int) -> Bool
    
    init(ascending: Bool = false) {
        if ascending {
            ordered = { $0 < $1}
        } else {
            ordered = {$0 > $1}
        }
    }
    
    public func center() -> Int?{
        if self.heap.count > 1 {
            var index = 0
            let length = self.heap.count - 1
            if length%2 == 0 {
                index = length/2
            } else {
                index = length/2 + 1
            }
            
            if length == 1 {
                index = 1
            }

            return self.heap[index]
        }
        return nil
    }
    
    
    public func count() -> Int {
        return self.heap.count - 1
    }
    
    public func insert(element: Int) {
        self.heap.append(element)
        var lastIndex = heap.count - 1
        while lastIndex > 1 {
            let parent = parentIndex(index: lastIndex)
            if self.ordered(self.heap[lastIndex]! ,self.heap[parent]!) {
                self.heap.swapAt(lastIndex, parent)
                lastIndex = parent
            } else {
                break
            }
        }
    }
    
    public func delete() {
        self.heap.swapAt(1, self.heap.count-1)
        self.heap.removeLast()
        self.heapify(i: 1)
    }
    
    public func pop() -> Int? {
        if self.heap.count > 1{
            if let element = self.heap[1] {
                self.delete()
                return element
            }
        }
        return nil
    }
    
    private func heapify(i: Int) {
        let left = self.leftChildIndex(index: i)
        let right = self.rightChildIndex(index: i)
        var smallest = i
        if left <= self.heap.count - 1 && ordered(self.heap[left]!, self.heap[smallest]!) {
            smallest = left
        }
        if right <= self.heap.count - 1 && ordered(self.heap[right]!, self.heap[smallest]!) {
            smallest = right
        }
        if smallest != i {
            self.heap.swapAt(i, smallest)
            heapify(i: smallest)
        }
    }
    
    private func parentIndex(index: Int) -> Int{
        return index/2
    }
    
    private func leftChildIndex(index: Int) -> Int {
        return 2*index
    }
    
    private func rightChildIndex(index: Int) -> Int {
        return 2*index + 1
    }
    
    
    
}
