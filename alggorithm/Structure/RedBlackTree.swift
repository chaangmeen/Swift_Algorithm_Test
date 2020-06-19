//
//  RedBlackTree.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/21.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation

public enum RedBlackTreeColor: Int {
    case red = 0
    case black = 1
}

// 루트가 바뀔 때의 문제가 발생한다. 

public class RedBlackTreeNode<T: Comparable> {
    
    public var value: T
    public var leftChild: RedBlackTreeNode?
    public var rightChild: RedBlackTreeNode?
    public weak var parent: RedBlackTreeNode?
    
    public var color: RedBlackTreeColor
    
    public init(value: T, left: RedBlackTreeNode?, right: RedBlackTreeNode?, parent: RedBlackTreeNode?, color: RedBlackTreeColor) {
        
        self.value = value
        self.color = color
        self.leftChild = left
        self.rightChild = right
        self.parent = parent
    }
    
    public convenience init(value: T) {
        self.init(value: value, left: nil, right: nil, parent: nil, color: RedBlackTreeColor.black)
    }
    
    deinit {
        print("deinit start")
        print("self.leftChild Value is \(leftChild?.value)")
        print("self.rightChild Value is \(rightChild?.value)")
        print("value is \(value)")
        print("deinit end")
    }
    
  
    
    public func grandParentNode() -> RedBlackTreeNode? {
        guard let grandParentNode = self.parent?.parent else {
            return nil
        }
        return grandParentNode
    }

    public func uncleNode() -> RedBlackTreeNode? {
        guard let grandParent = self.grandParentNode() else {
            return nil
        }
        if parent === grandParent.leftChild {
            return grandParent.rightChild
        } else {
            return grandParent.leftChild
        }
    }
    
    public static func printTree(nodes: [RedBlackTreeNode]) {
        var children: [RedBlackTreeNode] = Array()
        
        for node in nodes {
            print("\(node.value)" + " " + "\(node.color)")
            if let leftChild = node.leftChild {
                children.append(leftChild)
            }
            if let rightChild = node.rightChild {
                children.append(rightChild)
            }
        }
        
        if children.count > 0 {
            printTree(nodes: children)
        }
    }
    
    public func rotateRight() {
        
        guard let parent = parent else {
            return
        }
        
        // 나중을 위해 임시 참조값 저장
        let grandParent = parent.parent
        let newRightChildsLeftChild = self.rightChild
        var wasLeftChild = false
        if parent === grandParent?.leftChild {
            wasLeftChild = true
        }
        
        // 기존의 부모 노드를 새 우측 자식노드가 됨 (zig)
        self.rightChild = parent
        self.rightChild?.parent = self
        
        // 기존의 할아버지 노드가 새 부모노드가 됨
        self.parent = grandParent
        
        if wasLeftChild {
            grandParent?.leftChild = self
        } else {
            grandParent?.rightChild = self
        }
        
        self.rightChild?.leftChild = newRightChildsLeftChild
        self.rightChild?.leftChild?.parent = self.rightChild
        print("rotateRight end ==============")
    }
    
    
    public func rotateLeft() {        
        guard let parent = parent else {
            return
        } // parent 가 루트 노드 (10)
        
        let grandParent = parent.parent // nil
        let newLeftChildsRightChild = self.leftChild // 15
        var wasLeftChild = false //
        if parent === grandParent?.leftChild {
            wasLeftChild = true
        }
        
        self.leftChild = parent //10
        self.leftChild?.parent = self
        self.parent = grandParent
        if wasLeftChild {
            grandParent?.leftChild = self
        } else {
            grandParent?.rightChild = self
        }
        self.leftChild?.rightChild = newLeftChildsRightChild
        self.leftChild?.rightChild?.parent = self.rightChild

        print("rotateLeft end ==============")
    }
    
    public func insertNodeFromRoot(value: T) {
        if let _ = parent {
            print("You can only add new nodes from the root")
            return
        }
        
        self.addNode(value: value)
        print("insert end -------")
    }
    
    private func addNode(value: T) {
        if value < self.value {
            if let leftChild = leftChild {
                leftChild.addNode(value: value)
            } else {
                let newNode = RedBlackTreeNode(value: value)
                newNode.parent = self
                newNode.color = .red
                leftChild = newNode
                // 트리 컬러 구조 확인
                insertionReviewStep1(node: newNode)
                
            }
        } else {
            if let rightChild = rightChild {
                rightChild.addNode(value: value)
            } else {
                let newNode = RedBlackTreeNode(value: value)
                newNode.parent = self
                newNode.color = .red
                rightChild = newNode
                // 트리 컬러 구조 확인
                insertionReviewStep1(node: newNode)
            }
        }
    }
    
    // insert 한 노드로부터 확인
    // 1. 아무것도 없으면 루트(블랙)으로 삽입
    private func insertionReviewStep1(node: RedBlackTreeNode) {
        if let _ = node.parent {
            insertionReviewStep2(node: node)
        } else {
            node.color = .black
        }
        print("end step 1 ========")
    }
    
    // 2. 부모노드 블랙이면 그대로 놔둔다.
    private func insertionReviewStep2(node: RedBlackTreeNode) {
        if node.parent?.color == .black {
            return
        }
        // 부모 노드 레드일때
        insertionReviewStep3(node: node)
        print("end step 2 =========")
    }
    
    // 3. 부모와 삼촌이 레드인지 확인
    private func insertionReviewStep3(node: RedBlackTreeNode) {
        if let uncle = node.uncleNode() {
            if uncle.color == .red {
                node.parent?.color = .black
                uncle.color = .black
                if let grandParent = node.grandParentNode() {
                    grandParent.color = .red
                    insertionReviewStep1(node: grandParent)
                }
                return
            }
        }
        insertionReviewStep4(node: node)
        print("end step 3---------")
    }
    // 4. 부모는 레드, 삼촌은 블랙인 경우
    // 해당 노드는 우측 자식의 좌측 자식 or 좌측 자식의 우측 자식이다.
    private func insertionReviewStep4(node: RedBlackTreeNode) {
        var node = node
        
        guard let grandParent = node.grandParentNode() else {
            return
        }
        if node === node.parent?.rightChild && node.parent === grandParent.leftChild {
            //node.parent?.rotateLeft()
            node.rotateLeft()
            node = node.leftChild!
        } else if node === node.parent?.leftChild && node.parent === grandParent.rightChild {
            //node.parent?.rotateRight()
            node.rotateRight()
            node = node.rightChild!
        }
        insertionReviewStep5(node: node)
        print("end step 4 =---------")
    }
    
    private func insertionReviewStep5(node: RedBlackTreeNode) {
        
        guard let grandParent = node.grandParentNode() else {
            return
        }
        node.parent?.color = .black
        grandParent.color = .red

        if node.parent === grandParent.leftChild {
            node.parent?.rotateRight()
        } else {
            node.parent?.rotateLeft()
        }
        print("end final step ---------------")
    }
}
