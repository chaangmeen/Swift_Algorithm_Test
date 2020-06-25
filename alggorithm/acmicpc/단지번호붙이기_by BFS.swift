//
//let n = Int(readLine()!)!
//var matrix = [[Int]]()
//var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
//for _ in 0..<n {
//    let numArr = readLine()!.compactMap{$0.wholeNumberValue}
//    matrix.append(numArr)
//}
//
//func traverse() {
//    var result = [Int]()
//    for i in 0..<n {
//        for j in 0..<n {
//            if matrix[i][j] == 1 && !visited[i][j] {
//                result.append(bfs(first:(i,j)))
//            }
//        }
//    }
//    print(result.count)
//    result.sorted(by: <).map{print($0)}
//    
//}
//
//func bfs(first: (Int,Int)) -> Int {
//    var house = 0
//    var queue = [(Int,Int)]()
//    queue.append(first)
//    visited[first.0][first.1] = true
//    while !queue.isEmpty {
//        let current = queue.first!
//        let ways = getPossibleWay(point: current)
//        for path in ways {
//            if !visited[path.x][path.y] {
//                visited[path.x][path.y] = true
//                queue.append(path)
//            }
//        }
//        house += 1
//        queue.removeFirst()
//    }
//    
//    return house
//}
//
//
//func getPossibleWay(point: (x:Int,y:Int)) -> [(x:Int,y:Int)] {
//    var ways = [(Int,Int)]()
//    let x = point.x
//    let y = point.y
//
//    if x-1 >= 0 && matrix[x-1][y] == 1 && !visited[x-1][y]{
//        ways.append((x-1,y))
//    }
//    
//    if x+1 < n && matrix[x+1][y] == 1 && !visited[x+1][y]{
//        ways.append((x+1,y))
//    }
//    
//    if y+1 < n && matrix[x][y+1] == 1 && !visited[x][y+1]{
//        ways.append((x,y+1))
//    }
//    
//    if y-1 >= 0 && matrix[x][y-1] == 1 && !visited[x][y-1]{
//        ways.append((x,y-1))
//    }
//    return ways
//}
//
//traverse()
