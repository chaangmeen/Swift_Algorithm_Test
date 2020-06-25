import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var answer = 0
 
    bfs(numbers: numbers, depth: 0, target: target, value: 0, answer: &answer)
    
    return answer
}


func bfs(numbers: [Int], depth: Int, target: Int, value: Int, answer: inout Int) {
    
    if depth >= numbers.count {
        if target == value {
            answer += 1
        }
        return
    }
    bfs(numbers: numbers, depth: depth+1, target: target, value: value + numbers[depth], answer: &answer)
    bfs(numbers: numbers, depth: depth+1, target: target, value: value - numbers[depth], answer: &answer)
}



