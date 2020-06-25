//
//import Foundation
//
//let str = readLine()!.components(separatedBy: " ")
//let N = Int(str[0])!
//let M = Int(str[1])!
//var maze = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
//for i in 0..<N {
//    let str = readLine()!
//    let row = str.compactMap{$0.wholeNumberValue}
//    maze[i] = row
//}
//// 0,0 에서 n-1,n-1 까지 최소거리?
//class Point: Equatable, Hashable {
//    static func == (lhs: Point, rhs: Point) -> Bool {
//        return lhs.x == rhs.x && lhs.y == rhs.y
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(self.x & self.y)
//    }
//
//    let x: Int
//    let y: Int
//    var prev: Point?
//    init(x: Int, y: Int) {
//        self.x = x
//        self.y = y
//    }
//}
//
//
//func bfs(first: Point) {
//    var queue = [Point]()
//    queue.append(first)
//    var testVisit = Set<Point>()
//    while !queue.isEmpty {
//        let current = queue.first!
//        testVisit.insert(current)
//        if current.x == N-1 && current.y == M-1 {
//            getNum(end: current)
//            break
//        }
//
//        let arr = getPossiblePoint(x: current.x, y: current.y)
//        for p in arr {
//            if !testVisit.contains(p) || !queue.contains(p) {
//                p.prev = current
//                queue.append(p)
//            }
//        }
//        queue.removeFirst()
//    }
//}
//
//func getPossiblePoint(x: Int, y: Int) -> [Point] {
//
//    var result = [Point]()
//
//    if x+1 < N && maze[x+1][y] == 1 {
//        result.append(Point(x: x+1, y: y))
//    }
//
//    if y+1 < M && maze[x][y+1] == 1  {
//        result.append(Point(x: x, y: y+1))
//    }
//
//    if x-1 >= 0 && maze[x-1][y] == 1{
//        result.append(Point(x: x-1, y: y))
//    }
//
//    if y-1 >= 0 && maze[x][y-1] == 1 {
//        result.append(Point(x: x, y: y-1))
//    }
//
//    return result
//}
//
//func getNum(end: Point) {
//    var current: Point? = end
//    var count = 0
//    while current != nil {
//        count += 1
//        current = current!.prev
//    }
//    print(count)
//}
//
//bfs(first: Point(x: 0, y: 0))
