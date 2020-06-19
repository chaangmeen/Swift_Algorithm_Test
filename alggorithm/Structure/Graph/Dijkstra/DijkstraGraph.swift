//
//  DijkstraGraph.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/25.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation

public class DijkstraGraph<T: Hashable & Equatable> {
    public var nodes: [DijkstraNode<T>]
    public init(nodes: [DijkstraNode<T>]) {
        self.nodes = nodes
    }
    
    public static func dijkstraPath(startNode: DijkstraNode<T>, graph: DijkstraGraph<T>, finishNode: DijkstraNode<T>) {
        
        var unvisitedNodes = Set<DijkstraNode<T>>(graph.nodes)
        
        startNode.distance = 0
        
        //현재 노드를 할당
        var currentNode: DijkstraNode<T> = startNode
        
        while (finishNode.visited == false) {
            
            for edge in currentNode.edges.filter({$0.to.visited == false}) {
                // 현재 노드와 그 이웃 노드의 임시거리를 계산
                let temporaryDistance = currentNode.distance + Int(edge.weight)
                
                if edge.to.distance > temporaryDistance {
                    edge.to.distance = temporaryDistance
                    edge.to.previous = currentNode
                }
            }
            
            currentNode.visited = true
            
            unvisitedNodes.remove(currentNode)
            
            if let newCurrent = unvisitedNodes.sorted(by: { $0.distance < $1.distance}).first {
                currentNode = newCurrent
            } else {
                break
            }
        }
        
        //
        DijkstraGraph.printShortestPath(node: finishNode)
    }
    
    public static func printShortestPath(node: DijkstraNode<T>) {
        if let previous = node.previous {
            DijkstraGraph.printShortestPath(node: previous)
        } else {
            print("Shortest Path: ")
        }
        
        print("->\(node.value)",  terminator: "")
    }
}
