import Foundation

class Word {
    let value: String
    var nextNodes: [Word] = []
    var prev: Word?
    var visited = false
    
    
    init(value: String) {
        self.value = value
    }
}


func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    //변환
    let length = begin.count
    if !words.contains(target) {
        return 0
    }
    var nodes = [Word]()
    for w in words {
        nodes.append(Word(value: w))
    }
    var start = Word(value: begin)
    var finish = nodes.filter{$0.value == target}[0]
    var queue = [Word]()
    queue.append(start)
    
    var returnCount = 0
    
    while !queue.isEmpty {
        if finish.visited {
            var count = 1
            var cur = finish.prev
            while cur != nil {
                if let p = cur?.prev {
                    print(p.value)
                    cur = p
                    count += 1
                } else {
                    break
                }
            }
            print("최종횟수 :: count \(count)")
            if returnCount > count || returnCount == 0 {
                returnCount = count
            }
            break
        }
        
        start = queue.first!
        print("현잰")
        print(start.value)
        let ways = findPossibleNode(word: start.value, words: nodes)
        print("다음순서")
        for w in ways {
            if !w.visited {
                print(w.value)
                w.prev = start
                w.visited = true
                queue.append(w)
            }
        }
        print("-------------")
        queue.removeFirst()
    }
    

 
    return returnCount
}


func findPossibleNode(word: String, words: [Word]) -> [Word]{
    //hit
    let str = word.map{String($0)}
    var result = [Word]()
    var count = 0
    // 다른게 한글자면 변환가능
    for ex in words {
        count = 0
        for (index,char) in ex.value.enumerated() {
            if str[index] != String(char) {
                count += 1
            }
        }
        if count == 1 {
            result.append(ex)
        }
    }

    return result
}

//solution("hit", "cog", ["hot","dot","dog","lot","log","cog"])
