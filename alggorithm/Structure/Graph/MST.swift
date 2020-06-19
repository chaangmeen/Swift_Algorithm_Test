//
//  MST.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/25.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation

public class MSTNode<T: Equatable & Hashable> {
    public var value: T
    public var edges: [MSTEdge<T>]
    public var visited : Bool
    
    public init(value: T, edges: [MSTEdge<T>], visited: Bool) {
        self.value = value
        self.edges = edges
        self.visited = visited
    }
}


public class MSTEdge<T: Equatable & Hashable> {
    public var from: MSTNode<T>
    public var to: MSTNode<T>
    public var weight: Double
    
    public init(weight: Double, from: MSTNode<T>, to: MSTNode<T>) {
        self.weight = weight
        self.from = from
        self.to = to
        from.edges.append(self)
    }
}


public func == <T: Equatable> (lhs: MSTEdge<T>, rhs: MSTEdge<T>) -> Bool {
    guard lhs.from.value == rhs.from.value else {
        return false
    }
    guard lhs.to.value == rhs.to.value else {
        return false
    }
    return true
}


public class MSTGraph<T: Equatable & Hashable> {
    public var nodes: [MSTNode<T>]
    public init(nodes: [MSTNode<T>]) {
        self.nodes = nodes
    }
    
    public static func minimumSpanninggTree(startNode: MSTNode<T>, graph: MSTGraph<T>) {
        
        var visitedNodes: [MSTNode<T>] = []
        
        print(startNode.value)
        visitedNodes.append(startNode)
        startNode.visited = true
        
        while visitedNodes.count < graph.nodes.count {
            
            var unvisitedEdges: [MSTEdge<T>] = []
            
            _ = visitedNodes.map({ node in
                let edges = node.edges.filter({ (edge) -> Bool in
                    edge.to.visited == false
                })
                unvisitedEdges.append(contentsOf: edges)
            })
            
            
            if let minimumUnvisitedEdge = unvisitedEdges.sorted(by: { $0.weight < $1.weight}).first {
                print("\(minimumUnvisitedEdge.from.value) <-------> \(minimumUnvisitedEdge.to.value)")
                minimumUnvisitedEdge.to.visited = true
                visitedNodes.append(minimumUnvisitedEdge.to)
            }
            
        }
    }
}


