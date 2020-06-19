//
//  Edge.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/25.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation

public struct Edge<T: Equatable&Hashable> : Equatable {
    public let from: Vertex<T>
    public let to: Vertex<T>
    
    func hash() {
        
    }
}

public func == <T:Equatable> (lhs: Edge<T>, rhs: Edge<T>) -> Bool {
    guard  lhs.from == rhs.from else {
        return false
    }
    guard lhs.to == rhs.to else {
        return false
    }
    return true
}

extension Edge: Hashable {
    
    
    
    public var hashValue: Int {
        get {
            let stringHash = "\(from.index)->\(to.index)"
            return stringHash.hashValue
        }
    }
}
