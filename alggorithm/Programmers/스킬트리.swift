
import Foundation



func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var dic = [String: Int]()
    for (i,c) in skill.enumerated() {
        let a = String(c)
        dic[a] = i
    }
    
    var result = 0
    for str in skill_trees {
        if checkSkillTree(str: str, dic: dic) {
            result += 1
        }
    }
    
    
    return result
}

func checkSkillTree(str: String, dic: [String:Int]) -> Bool {
    
    var current = 0
    for char in str {
        let s = String(char)
        if let index = dic[s] {
            if index != current {
                return false
            } else {
                current += 1
            }
        }
    }
    
    return true
}
