//
//  Stack.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/14.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation


public struct Stack<T> {
    
    private var elements = [T]()
    public init() {}
    public mutating func pop() -> T? {
        return self.elements.popLast()
    }
    
    public mutating func push(element: T) {
        self.elements.append(element)
    }
    
    public func peak() -> T? {
        return self.elements.last
    }
    
    public var isEmpty: Bool {
        return self.elements.isEmpty
    }
    
    public var count: Int {
        return self.elements.count
    }
}

extension Stack: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return self.elements.description
    }
    
    public var debugDescription: String {
        return self.elements.debugDescription
    }
    
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        self.elements = elements
    }
}

public struct ArrayIterator<T>: IteratorProtocol {

    var currentElement: [T]
    init(elements: [T]) {
        self.currentElement = elements
    }

    public mutating func next() -> T? {
        if(!self.currentElement.isEmpty) {
            return self.currentElement.popLast()
        }
        return nil
    }
}

extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        return AnyIterator(IndexingIterator(_elements: self.elements.lazy.reversed()))
    }
    
    public init<S: Sequence>(_ s: S) where S.Iterator.Element == T {
        self.elements = Array(s.reversed())
    }
}

