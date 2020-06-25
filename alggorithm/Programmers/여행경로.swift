import Foundation

class TEdge {
    let from: String
    let to: String
    var visited = false
    init(from: String, to: String) {
        self.from = from
        self.to = to
    }
}
var result = [[String]]()


func solution(_ tickets:[[String]]) -> [String] {
    //다 방문해야한다.
    //시작점 ICN
    var edges = [TEdge]()
    for ticket in tickets {
        let ap1 = ticket[0]
        let ap2 = ticket[1]
        edges.append(TEdge(from: ap1, to: ap2))
    }
    
    
    way(current: "ICN", usage: 0, edges: edges, selected: ["ICN"])
    
    var strArr = [String]()
    for (idx,i) in result.enumerated() {
        strArr.append(i.reduce(""){$0 + $1})
    }
    
    let srt = strArr.sorted(by: <)[0]
    var final = [String]()
    for i in result {
        let str = i.reduce(""){ $0 + $1}
        if str == srt {
            final = i
        }
    }
    
    print(final)
    
    return final
}


func way(current: String, usage: Int, edges: [TEdge], selected: [String]) {
    
    if usage >= edges.count {
        result.append(selected)
        return
    }
        
    for e in edges {
        if e.from == current && !e.visited {
            e.visited = true
            way(current: e.to, usage: usage + 1, edges: edges, selected: selected + [e.to])
            e.visited = false
        }
    }
    
}


//티켓 모두 이용해야한다.
//solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]])

