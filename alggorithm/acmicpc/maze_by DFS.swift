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
//var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
//var result = [Int]()
//func dfs(current:[Int], isVisited: inout [[Bool]], selected: Int) {
//    
//    if isVisited[N-1][M-1] == true {
//        result.append(selected)
//        return
//    }
//    
//    let x = current[0]
//    let y = current[1]
//    isVisited[x][y] = true
//    let arr = getPossiblePoint(x: x, y: y)
//    
//    for p in arr {
//        if isVisited[p.x][p.y] == false {
//            isVisited[p.x][p.y] = true
//            dfs(current: [p.x,p.y], isVisited: &isVisited, selected: selected + 1)
//            isVisited[p.x][p.y] = false
//        }
//    }
//}
//
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
//
//dfs(current: [0,0], isVisited: &visited, selected: 1)
//result.sort(by: <)
//print(result.first!)
