

import Foundation

/// The Queue structure is a fixed-size data structure that stores data in a First In First Out (FIFO) collection.
///
public struct Queue<T> {
    
    private var data = [T]()
    
    // MARK: - Creating a Queue
    
    /// Constructs an empty Queue.
    public init() {}
    
    /// Constructs a Queue from a sequence.
    public init<S: Sequence>(_ elements: S) where S.Iterator.Element == T {
        data.append(contentsOf: elements)
    }
    

    public mutating func dequeue() -> T? {
        return data.removeFirst()
    }
    
    public func peek() -> T? {
        return data.first
    }
    
    public mutating func enqueue(element: T) {
        data.append(element)
    }

    public mutating func clear() {
        data.removeAll()
    }
    
    public var count: Int {
        return data.count
    }
    
    /// Returns the capacity of the queue.
    public var capacity: Int {
        get {
            return data.capacity
        }
        
        set {
            data.reserveCapacity(newValue)
        }
    }
    
    public func isFull() -> Bool {
        return count == data.capacity
    }
    
    public func isEmpty() -> Bool {
        return data.isEmpty
    }

    fileprivate func checkIndex(index: Int) {
        if index < 0 || index > count {
            fatalError("Index out of range")
        }
    }
    
}

// MARK: - CustomStringConvertible, CustomDebugStringConvertible
extension Queue: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        return data.description
    }
    
    public var debugDescription: String {
        return data.debugDescription
    }
}
//public struct QueueIterator<T>: IteratorProtocol {
//    var currentElement: [T]
//
//    public mutating func next() -> T? {
//        if !self.currentElement.isEmpty {
//            return currentElement.removeFirst()
//        }else {
//            return nil
//        }
//    }
//}
 
extension Queue: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        return AnyIterator(IndexingIterator(_elements: data.lazy))
    }
}

extension Queue: ExpressibleByArrayLiteral {
    
    // MARK: ExpressibleByArrayLiteral protocol conformance
    
    /// Constructs a queue using an array literal.
    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}

extension Queue: MutableCollection {
    public var startIndex: Int {
        return 0
    }
    
    public var endIndex: Int {
        return count - 1
    }
    
    public func index(after i: Int) -> Int {
        return data.index(after: i)
    }
    
    public subscript(index: Int) -> T {
        get {
            checkIndex(index: index)
            return data[index]
        }
        
        set {
            checkIndex(index: index)
            data[index] = newValue
        }
    }
}

