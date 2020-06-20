//
//  EnumLinkedList.swift
//  alggorithm
//
//  Created by 전창민 on 2020/06/20.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation
indirect enum TLinkedListNode<T> {
    case value(element: T, next: TLinkedListNode<T>)
    case end
}

extension TLinkedListNode: Sequence {
     func makeIterator() -> TLinkedListIterator<T> {
        return TLinkedListIterator(current: self)
    }
}

struct TLinkedListIterator<T>: IteratorProtocol {
    var current: TLinkedListNode<T>
    
    mutating func next() -> T? {
        switch current {
        case let .value(element, next):
            current = next
            return element
        case .end:
            return nil
        }
    }
}
