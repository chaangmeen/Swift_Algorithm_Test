//import Foundation
//
//
//class TTNode : Hashable {
//    let index: Int
//    var neighbours: Set<TTNode> = []
//    var visited = false
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(1010109898989)
//    }
//    init(index: Int) {
//        self.index = index
//    }
//    static func == (lhs: TTNode, rhs: TTNode) -> Bool {
//        return lhs.index == rhs.index
//    }
//    
//    func addNegihbours(node: TTNode) {
//        self.neighbours.insert(node)
//        node.neighbours.insert(self)
//    }
//}
//
//let numStr = readLine()!.components(separatedBy: " ")
//let N = Int(numStr[0])!
//let M = Int(numStr[1])!
//let startV = Int(numStr[2])!
//var nodes = [TTNode]()
//for i in 1...N {
//    let n = TTNode(index: i)
//    nodes.append(n)
//}
//
//
//// DFS , BFS 둘 다 실행해야한다.
//for _ in 0..<M {
//    let arr = readLine()!.components(separatedBy: " ")
//    let n1 = Int(arr[0])!
//    let n2 = Int(arr[1])!
//    nodes[n1-1].addNegihbours(node: nodes[n2-1])
//}
//
//var bfsArr = [Int]()
//
//func bfs(first: TTNode) {
//
//    var queue: [TTNode] = []
//    queue.append(first)
//    while !queue.isEmpty {
//        let node = queue.first!
//        node.visited = true
//        if !bfsArr.contains(node.index) {
//            bfsArr.append(node.index)
//        }
//        for neighbour in node.neighbours.sorted{ $0.index < $1.index } {
//            if !neighbour.visited {
//                queue.append(neighbour)
//            }
//        }
//        queue.removeFirst()
//    }
//}
//
//var dfsArr = [Int]()
//func dfs(node: TTNode) {
//
//    node.visited = true
//    if !dfsArr.contains(node.index) {
//        dfsArr.append(node.index)
//    }
//    for child in node.neighbours.sorted{ $0.index < $1.index } {
//        if !child.visited {
//            dfs(node: child)
//        }
//    }
//}
//
//
//dfs(node: nodes[startV-1])
//nodes = nodes.map{
//    $0.visited = false
//    return $0
//}
//bfs(first: nodes[startV-1])
//var a = dfsArr.map{String($0)}.joined(separator: " ")
//var b = bfsArr.map{String($0)}.joined(separator: " ")
//print(a)
//print(b)
