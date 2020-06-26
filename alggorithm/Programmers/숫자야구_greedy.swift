
import Foundation


func solution(_ baseball:[[Int]]) -> Int {
    
    
    var result = 0
    for i in 123...987 {
        let number = String(i)
        let firstIndex = number.startIndex
        let secondIndex = number.index(number.startIndex, offsetBy: 1)
        let thirdIndex = number.index(number.startIndex, offsetBy: 2)
        let indexs = [firstIndex, secondIndex, thirdIndex]
        var flag = true
        if number[firstIndex] == number[secondIndex] || number[secondIndex] == number[thirdIndex] || number[firstIndex] == number[thirdIndex]
        { continue }
        else if number[firstIndex] == "0" || number[secondIndex] == "0" || number[thirdIndex] == "0" { continue }
        for game in baseball {
            let example = String(game[0])
            var strike = 0
            var ball = 0
            for i in indexs {
                for j in indexs {
                    if i == j && number[i] == example[j] {
                        strike += 1
                        continue
                    }
                    if i != j && number[i] == example[j] {
                        ball += 1
                        continue
                    }
                }
            }
            if strike != game[1] || ball != game[2] {
                flag = false
                break
            }
        }
        
        if flag {
            result += 1
        }
        
    }
    print(result)
    return result
}


//solution([[123, 1, 1], [356, 1, 0], [327, 2, 0], [489, 0, 1]])
