import Foundation

func solution(citations:[Int]) -> Int {
    // n개 의 배열중에 h이상인 원소가 h개 이상 , 나머지 원소가 h이하이면 H-index
    let a = citations.sorted(by: <)
    let result = findHIndex(arr: a)
    return result
}

func findHIndex(arr: [Int]) -> Int {
    
    var r = 0
    for index in 0..<arr.count {
        var h = arr.count - index
        if arr[index] >= h {
            r = h
            break
        }
    }

    
    return r
}

//solution(citations: [5,5,5,5,5])
