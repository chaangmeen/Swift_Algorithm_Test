//
//  BFS-1.swift
//  alggorithm
//
//  Created by 전창민 on 2020/06/24.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation
//방향성
class BNode<T> {
    let value: T
    var edges = [BEdge<T>]()
    var visited = false

    init(value: T) {
        self.value = value
    }
    func appendEdgeTo(_ node: BNode<T>) {
        let edge = BEdge<T>(from: self, to: node)
        self.edges.append(edge)
    }
}

class BEdge<T> {
    weak var source: BNode<T>?
    let destination: BNode<T>
    init(from source: BNode<T>, to destination: BNode<T>) {
        self.source = source
        self.destination = destination
    }
}

//func practiceBFS(n: Int, edges: [(Int, Int)]) {
//    // Node, Edge setup
//    let nodes = (0..<n).map({ BNode<Int>(value: $0 + 1) })
//    for (from, to) in edges {
//        nodes[from - 1].appendEdgeTo(nodes[to - 1])
//
//    }
//    // 1. 궁극적으로 원하는 값
//    var shortest = Array(repeating: [1], count: n)
//    var queue = Queue<Node<Int>>()
//    queue.enqueue(nodes[0])
//    nodes[0].visited = true
//    while let node = queue.dequeue() {
//        for edge in node.edges {
//            let dest = edge.destination
//            guard dest.visited == false else { continue }
//            queue.enqueue(dest)
//            dest.visited = true
//            // 2. Node를 방문할 때 해야하는 처리
//            shortest[dest.value - 1] = shortest[node.value - 1] + [dest.value]
//        } } print(shortest) }
//
