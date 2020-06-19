//
//  AVLTree.swift
//  alggorithm
//
//  Created by 전창민 on 2020/05/22.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation

public class AVLTreeNode<T: Comparable> {

    public var value: T
    public var leftChild: AVLTreeNode?
    public var rightChild: AVLTreeNode?
    public weak var parent: AVLTreeNode?
    public var balanceFactor: Int = 0
    
    public convenience init(value: T) {
        self.init(value: value, leftChild: nil, rightChild: nil, parent: nil)
    }
    
    public init(value: T, leftChild: AVLTreeNode?, rightChild: AVLTreeNode?, parent: AVLTreeNode?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.parent = parent
        self.balanceFactor = 0
    }
    
    public func rotateLeft() -> AVLTreeNode {
        guard let parent = parent else {
            return self
        }
        
        let grandParent = parent.parent
        let newLeftChildsRightChild = self.leftChild
        var wasLeftChild = false
        
        if parent === grandParent?.leftChild {
            wasLeftChild = true
        }
        
        self.leftChild = parent
        self.leftChild?.parent = self
        
        self.parent = grandParent
        if wasLeftChild {
            grandParent?.leftChild = self
        } else {
            grandParent?.rightChild = self
        }
        
        self.leftChild?.rightChild = newLeftChildsRightChild
        self.leftChild?.rightChild?.parent = self.leftChild
    
        if self.balanceFactor == 0 {
            self.balanceFactor = -1
            self.rightChild?.balanceFactor = 1
        } else {
            self.balanceFactor = 0
            self.rightChild?.balanceFactor = 0
        }
        return self
    }
    
    public func rotateRight() -> AVLTreeNode {
        guard let parent = parent else {
            return self
        }
        
        let grandParent = parent.parent
        let newRightChildsLeftChild = self.rightChild
        var wasLeftChild = false
        if parent === grandParent?.leftChild {
            wasLeftChild = true
        }
        
        self.rightChild = parent
        self.rightChild?.parent = self
        
        self.parent = grandParent
        if wasLeftChild {
            grandParent?.leftChild = self
        } else {
            grandParent?.rightChild = self
        }
        
        self.rightChild?.leftChild = newRightChildsLeftChild
        self.rightChild?.leftChild?.parent = self.rightChild
        
        if self.balanceFactor == 0 {
            self.balanceFactor = 1
            self.leftChild?.balanceFactor = -1
        } else {
            self.balanceFactor = 0
            self.leftChild?.balanceFactor = 0
        }
        return self
    }
    
      //Right - Left
    public func rotateRightLeft() -> AVLTreeNode {
        
        // 1: Double rotation
        _ = self.rotateRight()
        _ = self.rotateLeft()
        
        // 2: Update Balance Factors
        if (self.balanceFactor > 0) {
            self.leftChild?.balanceFactor = -1;
            self.rightChild?.balanceFactor = 0;
        }
        else if (self.balanceFactor == 0) {
            self.leftChild?.balanceFactor = 0;
            self.rightChild?.balanceFactor = 0;
        }
        else {
            self.leftChild?.balanceFactor = 0;
            self.rightChild?.balanceFactor = 1;
        }
        
        self.balanceFactor = 0;
        
        return self
    }
    
    //Left - Right
    public func rotateLeftRight() -> AVLTreeNode {
        
        // 1: Double rotation
        _ = self.rotateLeft()
        _ = self.rotateRight()
        
        // 2: Update Balance Factors
        if (self.balanceFactor > 0) {
            self.leftChild?.balanceFactor = -1;
            self.rightChild?.balanceFactor = 0;
        }
        else if (self.balanceFactor == 0) {
            self.leftChild?.balanceFactor = 0;
            self.rightChild?.balanceFactor = 0;
        }
        else {
            self.leftChild?.balanceFactor = 0;
            self.rightChild?.balanceFactor = 1;
        }
        
        self.balanceFactor = 0;
        
        return self
    }
    
    public func insertNodeFromRoot(value: T) {
        if let _ = self.parent {
            print("You can only add new nodes from the root node of the tree")
            return
        }
        
        self.addNode(value: value)
    }
    
    private func addNode(value: T) {
        if value < self.value {
            if let leftChild = leftChild {
                leftChild.addNode(value: value)
            } else {
                let newNode = AVLTreeNode(value: value)
                newNode.parent = self
                leftChild = newNode
            }
        } else {
            if let rightChild = rightChild {
                rightChild.addNode(value: value)
            } else {
                let newNode = AVLTreeNode(value: value)
                newNode.parent = self
                rightChild = newNode
            }
        }
    }
    
    // Prints each layer of the tree from top to bottom with the node value and the balance factor
    public static func printTree(nodes:[AVLTreeNode]) {
        var children:[AVLTreeNode] = Array()
        
        for node:AVLTreeNode in nodes {
            print("\(node.value)" + " " + "\(node.balanceFactor)")
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

}

