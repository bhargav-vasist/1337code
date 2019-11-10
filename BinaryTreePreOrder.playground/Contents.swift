import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
    }
}

func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let _ = root else {
        return []
    }
    var preParentNode: TreeNode?
    var returnArray: [Int] = []
    
    returnArray.append((root?.val)!)
    
    
    // currentNode = nodeTraversalArray[0]
    // parentNode = nodeTraversalArray[1]
    // preParentNode = nodeTraversalArray[2]
    var nodeTraversalArray: [TreeNode?] = [nil, nil, nil]
    
    nodeTraversalArray.insert(root, at: 0)
    
    repeat {
        while (nodeTraversalArray.first??.left != nil || nodeTraversalArray.first??.right != nil) {
            while (nodeTraversalArray.first??.left != nil) {
                if let val = nodeTraversalArray.first??.left?.val {
                    returnArray.append(val)
                    nodeTraversalArray.insert(nodeTraversalArray.first??.left, at: 0)
                }
            }
            if let val = nodeTraversalArray.first??.right?.val {
                returnArray.append(val)
                nodeTraversalArray.insert(nodeTraversalArray.first??.right, at: 0)
            }
        }
        if (nodeTraversalArray.first??.val == nodeTraversalArray[1]?.left?.val){
            nodeTraversalArray[1]?.left = nil
        } else {
            nodeTraversalArray[1]?.right = nil
        }
        nodeTraversalArray.removeFirst()
    } while ((nodeTraversalArray.first??.left != nil || nodeTraversalArray.first??.right != nil) || nodeTraversalArray[1] != nil)
    
    print("Here ya go bud \(returnArray)")
    return returnArray
}

let root: TreeNode? = TreeNode(1)
let x: TreeNode? = TreeNode(2)
let y: TreeNode? = TreeNode(3)
let z: TreeNode? = TreeNode(4)
let a: TreeNode? = TreeNode(5)

root?.left = x
root?.right = y

x?.left = z
z?.left = a

preorderTraversal(root)
