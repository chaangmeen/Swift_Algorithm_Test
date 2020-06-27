
import Foundation

func solution(name:String) -> Int {
    // AAAA 를 JAZZ 등으로 이동횟수
    let length = name.count
    var str = name
    var count = 0
    var execCount = 0
    var result = 0
    while execCount < 2 {
        count = 0
        print(str)
        for (index,char) in str.enumerated(){
            // ascii코드로 판단?
            print(char)
            if char == "A" {
                // A면 조작 안하고 바로 ->
                var endFlag = true
                for i in index+1..<str.count {
                    let strIndex = str.index(str.startIndex, offsetBy: i)
                    if str[strIndex] != "A" {
                        endFlag = false
                    }
                }
    
                if endFlag {
                    count -= 1
                    break
                }
                
                if index != length - 1 {
                    count += 1
                    print(count)
                } else {
                    count -= 1
                    print(count)
                }
                continue
            }
            let alphaNumber = Int(char.asciiValue!)
            if alphaNumber <= 78 {
                count += alphaNumber - 65
                print(alphaNumber - 65)
            } else {
                count += 91 - alphaNumber
                print(91 - alphaNumber)
            }
            //옆으로 ->
            if index != length - 1 {
                count += 1
            }
            print(count)
        }
        print(count)
        if result > count || result == 0 {
            result = count
        }
        execCount += 1
        let first = str.remove(at: str.startIndex)
        str = String(first) + String(str.reversed())
    }
    
    print(result)
    
    return result
}

//solution(name: "AZAAAZ")


