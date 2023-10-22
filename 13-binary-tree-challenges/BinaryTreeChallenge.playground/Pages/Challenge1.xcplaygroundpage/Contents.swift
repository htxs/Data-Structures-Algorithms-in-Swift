/*:
 # Binary Tree Challenges
 ## Challenge 1: Height of a Tree
 
 Given a binary tree, find the height of the tree. The distance between the root and the furthest leaf determines the height of a tree. The height of a binary tree with a single node is zero since the single node is both the root and the furthest leaf.
 */

func height<T>(of node: BinaryNode<T>?) -> Int {
    guard let node = node else {
        return -1
    }
    return 1 + max(height(of: node.leftChild), height(of: node.rightChild))
}

func makeTree() -> BinaryNode<Int> {
    let zero = BinaryNode(value: 0)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let seven = BinaryNode(value: 7)
    let eight = BinaryNode(value: 8)
    let nine = BinaryNode(value: 9)
    
    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    seven.rightChild = nine
    
    return seven
}

example(of: "tree diagram") {
    let tree = makeTree()
    print(tree)
}

example(of: "height of a tree") {
    let tree = makeTree()
    let height = height(of: tree)
    print(height)
}

//: [Next Challenge](@next)
