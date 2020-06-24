import Foundation

func solution(_ heights:[Int]) -> [Int] {

    var result = [Int]()
    
    let length = heights.count
    
    let reversedHeights: [Int] = Array(heights.reversed())
    
    for (i,num) in reversedHeights.enumerated() {
        let current = Int(num)
        var getSignal = -1
        for j in i+1..<length {
            if reversedHeights[j] > current {
                getSignal = length-j
                result.append(getSignal)
                break
            }
        }
        if getSignal == -1 {
            result.append(0)
        }
    }
    var reverseResult: [Int] = result.reversed()
    
    return reverseResult
}



