//
//  DijkstraEdge.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/25.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation

public class DijkstraEdge<T:Equatable & Hashable>:Equatable {
    public var from:DijkstraNode<T>
    public var to:DijkstraNode<T>
    public var weight:Double
    
    //Initialization
    public init(weight:Double, from:DijkstraNode<T>, to:DijkstraNode<T>) {
        self.weight = weight
        self.from = from
        self.to = to
        
        from.edges.append(self)
    }
}

public func == <T: Equatable> (lhs: DijkstraEdge<T>, rhs: DijkstraEdge<T>) -> Bool {
    guard lhs.from.value == rhs.from.value else {
        return false
    }
    guard lhs.to.value == rhs.to.value else {
        return false
    }
    return true
}

extension DijkstraEdge: Hashable {
    public var hashValue: Int {
        get {
            let stringHash = "\(from.value)->\(to.value)"
            return stringHash.hashValue
        }
    }
}
