import Foundation

func solution(ss:String) -> String {
    
    let strArr = ss.components(separatedBy: " ")
    var result = ""
    for str in strArr {
        var tmp = ""
        for (i,s) in str.lowercased().enumerated() {
            if i == 0 && s.isLetter{
                let char = String(s).uppercased()
                tmp.append(char)
            } else {
                tmp.append(String(s))
            }
        }
        result += "\(tmp) "
    }
    result.removeLast()
    return result
}

//solution(s:"3people unFollowed me")

