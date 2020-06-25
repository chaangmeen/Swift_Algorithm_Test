import Foundation


func solution(_ numbers:String) -> Int {
        
    let strArr = numbers.compactMap{String($0)}
    // 각 자리수 체크
    let visited = [Bool](repeating: false, count: numbers.count)
    traverse(numbers: strArr, index: 0, visited: visited, selected:"")
    let a = returnArr.compactMap{Int($0)}.filter{isPrime($0)}
    var result = Set<Int>()
    a.map{result.insert($0)}
    print(result)
    
    return 0
}

var returnArr = [String]()

func traverse(numbers: [String], index: Int, visited: [Bool], selected: String) {
    
    if index > numbers.count {
        return
    }
    var isVisited = visited
    returnArr.append(selected)
    for i in 0..<numbers.count {
        if !isVisited[i] {
            isVisited[i] = true
            traverse(numbers: numbers, index: index+1, visited: isVisited, selected: selected + numbers[i])
            isVisited[i] = false
        }
    }
}


func isPrime(_ n: Int) -> Bool {
    guard n >= 2     else { return false }
    guard n != 2     else { return true  }
    guard n % 2 != 0 else { return false }
    return !stride(from: 3, through: Int(sqrt(Double(n))), by: 2).contains { n % $0 == 0 }
}

