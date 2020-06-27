
import Foundation

class dirEdge: Hashable {
    typealias point = (Int,Int)
    
    let from : point
    let to: point
    
    init(from: point, to: point ) {
        self.from = from
        self.to = to
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(from.0.hashValue & to.0.hashValue | from.1.hashValue & to.1.hashValue)
    }
    
    static func == (lhs: dirEdge, rhs: dirEdge) -> Bool {
        return lhs.from == rhs.from && lhs.to == rhs.to || lhs.from == rhs.to && lhs.to == rhs.from
    }
}


func solution(dirs:String) -> Int {
    //처음 길어본 길의 길이
    var result = 0
    var x = 0
    var y = 0
    var edges = Set<dirEdge>()
    
    for dir in dirs {
  
        let currentFrom = (x,y)
        var newX = x
        var newY = y
        if dir == "U" {
            if isInside(curx: x, cury: y, dir: "U") {
                newY += 1
            }
        } else if dir == "D" {
            if isInside(curx: x, cury: y, dir: "D") {
                newY -= 1
            }
        } else if dir == "R" {
            if isInside(curx: x, cury: y, dir: "R") {
                newX += 1
            }
        } else if dir == "L" {
            if isInside(curx: x, cury: y, dir: "L") {
                newX -= 1
            }
        }
        let currentTo = (newX, newY)
        
        if currentTo != currentFrom {
            edges.insert(dirEdge(from: currentFrom, to: currentTo))
        }
        x = newX
        y = newY
        
    }
    for e in edges {
        print(e.from, e.to)
    }
    
    
    print(edges.count)
    return edges.count
}

func isInside(curx: Int, cury: Int, dir: String) -> Bool {
    var bool = true
    
    if dir == "U" && cury >= 5 {
        bool = false
    } else if dir == "D" && cury <= -5 {
        bool = false
    } else if dir == "R" && curx >= 5 {
        bool = false
    } else if dir == "L" && curx <= -5 {
        bool = false
    }
    
    return bool
}




//solution(dirs: "ULURRDLLU")
