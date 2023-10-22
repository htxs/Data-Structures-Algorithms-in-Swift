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

example(of: "in-order traversal") {
    let tree = makeTree()
    tree.traverseInOrder { print($0) }
}

example(of: "pre-order traversal") {
    let tree = makeTree()
    tree.traversePreOrder { print($0) }
}

example(of: "post-order traversal") {
    let tree = makeTree()
    tree.traversePostOrder { print($0) }
}
