//import Foundation



//let firstLine = readLine()!.components(separatedBy: " ")
//let M = Int(firstLine[0])!
//let N = Int(firstLine[1])!
//var strArr: [String] = []
//for _ in 0..<M {
//    let str = readLine()!
//    strArr.append(str)
//
//}
//
//func changeToIntBoard( board: [String]) -> [[Int]] {
//    var intBoard = [[Int]](repeating: [Int](repeating: 0, count: board[0].count), count: board.count)
//    for (i,_) in board.enumerated() {
//        for (j,c) in board[i].enumerated() {
//            if c == "B" {
//                intBoard[i][j] = 1
//            }
//        }
//    }
//    return intBoard
//}
//
//var board = changeToIntBoard(board: strArr)
//
//func checkIsRightColor(checkBoard: [[Int]], rowStart: Int, colStart: Int) -> (Int) {
//    var tempBoard = checkBoard
//    var count = 0
//    for i in rowStart..<rowStart+7 {
//        for j in colStart..<colStart+7 {
//            if i+1 >= M || j+1 >= N {
//                continue
//            }
//            if tempBoard[i][j] == 1 && (tempBoard[i][j+1] == 1 || tempBoard[i+1][j] == 1 ) {
//                 if tempBoard[i][j+1] == 1 {
//                     tempBoard[i][j+1] = 0
//                     count += 1
//                 }
//                 if tempBoard[i+1][j] == 1 {
//                     tempBoard[i+1][j] = 0
//                     count += 1
//                 }
//             } else if tempBoard[i][j] == 0  && (tempBoard[i][j+1] == 0 || tempBoard[i+1][j] == 0 ) {
//                if tempBoard[i][j+1] == 0 {
//                    tempBoard[i][j+1] = 1
//                    count += 1
//                }
//                if tempBoard[i+1][j] == 0 {
//                    tempBoard[i+1][j] = 1
//                    count += 1
//                }
//            }
//        }
//    }
//    return count
//}
//var result = 100000000000
//
//for i in 0..<M {
//    for j in 0..<N {
//        if i+7 >= M || j+7 >= N {
//            continue
//        }
//
//        let count = checkIsRightColor(checkBoard: board, rowStart: i, colStart: j)
//
//        if  result > count {
//            result = count
//        }
//
//    }
//
//}
//print(result)
