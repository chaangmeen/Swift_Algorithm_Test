//
//  Graph.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/25.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation

public struct Vertex<T: Equatable&Hashable> : Equatable {
    
    public var data: T
    public let index:Int
    
}

public func == <T: Equatable> (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
    guard lhs.data == rhs.data else {
        return false
    }
    return true
}

extension Vertex: Hashable {
    public var hashValue: Int {
        get {
            return "\(index)".hashValue
        }
    }
}
