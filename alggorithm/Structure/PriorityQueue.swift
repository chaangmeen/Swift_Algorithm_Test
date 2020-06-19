//
//  PriorityQueue.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/15.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation


public struct PriorityQueue<T: Comparable> {
    
    fileprivate var heap = [T]()
    
    private let ordered: (T,T) -> Bool
    
    public init(ascending: Bool = false, startingValues: [T] = []) {
        if ascending {
            ordered = { $0 > $1}
        } else {
            ordered = {$0 < $1}
        }
        
        heap = startingValues
        var i = heap.count/2 - 1
        while i >= 0 {
            sink(i)
            i -= 1
        }
    }
    
    public var count: Int { return heap.count}
    
    public var isEmpty: Bool { return heap.isEmpty}
    
    public mutating func push(_ element: T) {
        heap.append(element)
        swim(heap.count - 1)
    }
    
    public mutating func pop() -> T? {
        if heap.isEmpty {return nil}
        if heap.count == 1 {heap.removeFirst()}
        
        heap.swapAt(0, heap.count - 1)
        let temp = heap.removeLast()
        sink(0)
        return temp
    }
    
    public mutating func remove(_ item: T) {
        if let index = heap.firstIndex(of: item) {
            heap.swapAt(index, heap.count - 1)
            heap.removeLast()
            swim(index)
            sink(index)
        }
    }
    
    public mutating func removeAll(_ item: T) {
        var lastCount = heap.count
        remove(item)
        while (heap.count < lastCount) {
            lastCount = heap.count
            remove(item)
        }
    }
    
    public func peek() -> T? {
        return heap.first
    }
    
    public mutating func clear() {
        heap.removeAll(keepingCapacity: false)
    }
    
    private mutating func sink(_ index: Int) {
        var index = index
        while 2 * index + 1 < heap.count {
            var j = 2 * index + 1
            if j < (heap.count - 1 ) && ordered(heap[j], heap[j+1]) {
                j += 1
            }
            if !ordered(heap[index], heap[j]) {
                break
            }
            heap.swapAt(index, j)
            index = j
        }
    }
    
    private mutating func swim(_ index: Int) {
        var index = index
        while index > 0 && ordered(heap[(index-1) / 2], heap[index]) {
            heap.swapAt((index-1)/2, index)
            index = (index-1)/2
        }
    }
}

extension PriorityQueue: IteratorProtocol {
    public typealias Element = T
    mutating public func next() -> Element? {return pop()}
}

extension PriorityQueue: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return heap.description
    }
    
    public var debugDescription: String {
        return heap.debugDescription
    }
}

extension PriorityQueue: Collection {
    public typealias Index = Int
    
    public var startIndex: Int {
        return heap.startIndex
    }
    
    public var endIndex: Int {
        return heap.endIndex
    }
    
    public subscript(position: Int) -> T {
        return heap[position]
    }
    
    public func index(after i: PriorityQueue.Index) ->
        PriorityQueue.Index {
            return heap.index(after: i)
        }
    
}

