
import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    // 10 2 몇 총 갯수는 12 전체 카펫의 크기 구하는 알고리즘
    // 가로 >= 세로 (col >= row) 둘다 3 이상
    let sum = brown + yellow
    var result = (0,0)
    //곱셈 경우의 수 다 구해야한다.
    let cases = getMultipleNumber(number: sum)
    for (row,col) in cases {
        let exam = 2*col + 2*(row-2)
        if exam == brown {
            result = (col,row)
            print(result)
            break
        }
    }
    
    return [result.0,result.1]
}

func getMultipleNumber(number: Int) -> [(Int,Int)]{
    let half = number/2
    var arr = [(Int,Int)]()
    var row = 0
    var col = 0
    for i in 3..<half {
        row = i
        if number.isMultiple(of: i) {
            col = number/i
            if row <= col {
                arr.append((row,col))
            }
        }
    }
    return arr
}

//solution(24, 24)

