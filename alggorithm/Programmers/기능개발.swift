
import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var updatedProgresses = progresses
    var updatedSpeeds = speeds
    var results: [Int] = []
    while updatedProgresses.count > 0 {
        var result = 0
        for i in 0..<updatedProgresses.count {
            updatedProgresses[i] = updatedProgresses[i] + updatedSpeeds[i]
        }
        while updatedProgresses.count > 0 {
            if updatedProgresses[0] >= 100 {
                updatedProgresses.removeFirst()
                updatedSpeeds.removeFirst()
                result += 1
            } else {
                break
            }
        }
        if result > 0 {
            results.append(result)
        }
    }
    return results
}
