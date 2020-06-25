//import Foundation
//
//
//class DiNode: Hashable {
//    let index: Int
//    var edges: [DiEdge] = []
//    var prev: DiNode?
//    var visited: Bool =  false
//    var distance = Int.max
//    init(index: Int) {
//        self.index = index
//    }
//
//    static func == (lhs: DiNode, rhs: DiNode) -> Bool {
//        return lhs.index == rhs.index
//    }
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(self.index.hashValue)
//    }
//}
//
//class DiEdge: Hashable {
//    var from:  DiNode
//    var to: DiNode
//    var weight: Int
//    init(from: DiNode, to: DiNode, weight: Int) {
//        self.from = from
//        self.to = to
//        self.weight = weight
//        from.edges.append(self)
//    }
//    static func == (lhs: DiEdge, rhs: DiEdge) -> Bool {
//        return lhs.from == rhs.from && lhs.to == rhs.to
//    }
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(self.from.hashValue&self.to.hashValue)
//    }
//}
//
//let firstLine = readLine()!.components(separatedBy: " ")
//let V = Int(firstLine[0])!
//let E = Int(firstLine[1])!
//let start = Int(readLine()!)!
//var nodes = Set<DiNode>()
//var edges = Set<DiEdge>()
//for _  in 0..<E {
//    let str = readLine()!.components(separatedBy: " ")
//    let from = Int(str[0])!
//    var n1 = DiNode(index: from)
//    let to = Int(str[1])!
//    var n2 = DiNode(index: to)
//    let weight = Int(str[2])!
//
//    if nodes.contains(n1) {
//        n1 = nodes.filter{$0.index == from}[0]
//    } else {
//        nodes.insert(n1)
//    }
//
//    if nodes.contains(n2) {
//        n2 = nodes.filter{$0.index == to}[0]
//    } else {
//        nodes.insert(n2)
//    }
//
//    edges.insert(DiEdge(from: n1, to: n2, weight: weight))
//}
//
//
//
//func dijkstra(startNode: DiNode, finishNode: DiNode) {
//    var unvisitedNode : Set<DiNode> = nodes
//    var current = startNode
//    current.distance = 0
//
//    while !finishNode.visited {
//        let edges = current.edges.filter{!$0.to.visited}
//        for e in edges {
//            let tempDistance = current.distance + e.weight
//            if e.to.distance > tempDistance {
//                e.to.distance = tempDistance
//                e.to.prev = current
//            }
//        }
//
//        current.visited = true
//        unvisitedNode.remove(current)
//        if let newCurrent = unvisitedNode.sorted{ $0.distance < $1.distance }.first {
//            current = newCurrent
//        } else {
//            break
//        }
//    }
//}
//
//let sortNodes = nodes.sorted{$0.index < $1.index}
//for i in sortNodes {
//    dijkstra(startNode: sortNodes[start-1], finishNode: i)
//    if i.distance == Int.max {
//        print("INF")
//    } else {
//        print(i.distance)
//    }
//}
//
