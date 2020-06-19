//
//  ListMergeSort.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/17.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation


func mergeSort<T: Comparable>(list: inout LinkedList<T>) {
    var left: Node<T>? = nil
    var right: Node<T>? = nil
    
    
    if list.head == nil || list.head?.next == nil {
        return
    }
    
    frontBackSplit(list: &list, front: &left, back: &right)

    var leftList = LinkedList<T>()
    leftList.head = left
    
    var rightList = LinkedList<T>()
    rightList.head = right
    
    mergeSort(list: &leftList)
    mergeSort(list: &rightList)
    
    list.head = merge(left: leftList.head, right: rightList.head)
}

private func merge<T: Comparable>(left: Node<T>?, right: Node<T>?) -> Node<T>? {
    
    var result: Node<T>? = nil
    
    if left == nil {
        return right
    }
    
    if right == nil {
        return left
    }
    
    if left!.data <= right!.data {
        result = left
        result?.next = merge(left: left?.next, right: right)
    } else {
        result = right
        result?.next = merge(left: left, right: right?.next)
    }
    
    return result
}

private func frontBackSplit<T: Comparable>( list: inout LinkedList<T>, front: inout Node<T>?, back: inout Node<T>?) {
    
    var fast: Node<T>?
    var slow: Node<T>?
    
    if list.head == nil || list.head?.next == nil {
        front = list.head
        back = nil
    } else {
        slow = list.head
        fast = list.head?.next
        
        while fast != nil {
            fast = fast?.next
            if fast != nil {
                slow = slow?.next
                fast = fast?.next
            }
        }
        
        front = list.head
        back = slow?.next
        slow?.next = nil
    }
}
