//
//  DijkstraNode.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/25.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation

public class DijkstraNode<T: Equatable & Hashable>: Equatable {
    //Value, visit status and reference vars
    public var value:T
    public var edges:[DijkstraEdge<T>]
    public var visited:Bool
    
    //Shortest distance to this node from the origin
    public var distance:Int = Int.max
    //Previous node to this in the shortest path
    public var previous:DijkstraNode<T>?
    
    //Initialization
    public init(value:T, edges:[DijkstraEdge<T>], visited:Bool) {
        self.value = value
        self.edges = edges
        self.visited = visited
    }
}
public func == <T: Equatable> (lhs: DijkstraNode<T>, rhs: DijkstraNode<T>) -> Bool {
    guard lhs.value == rhs.value else {
        return false
    }
    
    return true
}

extension DijkstraNode: Hashable {
    public var hashValue: Int {
        get {
            return value.hashValue
        }
    }
}
