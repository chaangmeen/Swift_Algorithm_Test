import Foundation

//class TNode<T: Equatable> : Hashable {
//    static func == (lhs: TNode<T>, rhs: TNode<T>) -> Bool {
//        return lhs.value == rhs.value
//    }
//
//    let value: T
//    var neighbours: Set<TNode>
//    var visited = false
//    var parent: TNode?
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(123)
//    }
//
//    init(value: T, neighbours: Set<TNode>) {
//        self.value = value
//        self.neighbours = neighbours
//    }
//
//    public func addNeighbour(node: TNode) {
//        self.neighbours.insert(node)
//        node.neighbours.insert(self)
//    }
//}
//
//let num = Int(readLine()!)!
//var nodes:[TNode<Int>] = []
//for i in 1..<num+1 {
//    let node = TNode(value: i, neighbours: [])
//    nodes.append(node)
//}
//
//for _ in 0..<num-1 {
//    let str = readLine()!.components(separatedBy: " ")
//    let n1 = Int(str[0])!
//    let n2 = Int(str[1])!
//    nodes[n1-1].addNeighbour(node: nodes[n2-1])
//}
//
//let first = nodes[0]
//
//func bfs(first: TNode<Int>) {
//    var queue: [TNode<Int>] = [first]
//    while !queue.isEmpty {
//        if let node = queue.first {
//            node.visited = true
//            for neighbour in node.neighbours {
//                if neighbour.visited == false {
//                    neighbour.parent = node
//                    queue.append(neighbour)
//                }
//            }
//            queue.removeFirst()
//        }
//    }
//}
//
//bfs(first: first)
//
//for i in 1..<nodes.count {
//    print(nodes[i].parent!.value)
//}
