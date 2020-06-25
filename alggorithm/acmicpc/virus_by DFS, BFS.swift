//import Foundation
//
//class HNode: Hashable {
//    let index: Int
//    var neighbours: Set<HNode> = []
//    var visited = false
//    init(index: Int) {
//        self.index = index
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(self.index.hashValue)
//    }
//    
//    static func == (lhs: HNode, rhs: HNode) -> Bool {
//        return lhs.index == rhs.index
//    }
//    
//    func addNeighbour(node: HNode) {
//        node.neighbours.insert(self)
//        self.neighbours.insert(node)
//    }
//}
//
//
//
//let N = Int(readLine()!)!
//let M = Int(readLine()!)!
//var nodes = [HNode]()
//for i in 1...N {
//    let n = HNode(index: i)
//    nodes.append(n)
//}
//for _ in 0..<M {
//    // 엣지
//    let str = readLine()!.components(separatedBy: " ")
//    let n1 = Int(str[0])!
//    let n2 = Int(str[1])!
//    nodes[n1-1].addNeighbour(node: nodes[n2-1])
//}
//
//func bfs(first: HNode) {
//    
//    var queue = [HNode]()
//    queue.append(first)
//    while !queue.isEmpty {
//        let node = queue.first!
//        node.visited = true
//        for n in node.neighbours {
//            if !n.visited {
//                queue.append(n)
//            }
//        }
//        queue.removeFirst()
//    }
//}
//
//func dfs(node: HNode) {
//    node.visited = true
//    for n in node.neighbours {
//        if !n.visited {
//            dfs(node: n)
//        }
//    }
//    
//}
//
//dfs(node: nodes[0])
//let count = nodes.filter{$0.visited}.count - 1
//
//print(count)
//
