/*:
 [Previous Challenge](@previous)
 ## Challenge 2: Serialization
 
 A common task in software development is serializing an object into another data type. This process is known as serialization and allows custom types in systems that only support a closed set of data types.

 An example of serialization is JSON. Your task is to devise a way to serialize a binary tree into an array and deserialize the array back into the same binary tree.

 To clarify this problem, consider the following binary tree:
 
 ![Binary Tree](Binary-Tree.png)
 
 A particular algorithm may output the serialization as [15, 10, 5, nil, nil, 12, nil, nil, 25, 17, nil, nil, nil]. The deserialization process should transform the array back into the same binary tree. Note that there are many ways to perform serialization. You may choose any way you wish.
 */

extension BinaryNode {
    public func fullTraversePreOrder(visit: (T?) -> Void) {
        visit(value)
        if let leftChild = leftChild {
            leftChild.fullTraversePreOrder(visit: visit)
        } else {
            visit(nil)
        }
        if let rightChild = rightChild {
            rightChild.fullTraversePreOrder(visit: visit)
        } else {
            visit(nil)
        }
    }
    
    public func fullTraverseInOrder(visit: (T?) -> Void) {
        if let leftChild = leftChild {
            leftChild.fullTraverseInOrder(visit: visit)
        } else {
            visit(nil)
        }
        visit(value)
        if let rightChild = rightChild {
            rightChild.fullTraverseInOrder(visit: visit)
        } else {
            visit(nil)
        }
    }

    public func fullTraversePostOrder(visit: (T?) -> Void) {
        if let leftChild = leftChild {
            leftChild.fullTraversePostOrder(visit: visit)
        } else {
            visit(nil)
        }
        if let rightChild = rightChild {
            rightChild.fullTraversePostOrder(visit: visit)
        } else {
            visit(nil)
        }
        visit(value)
    }
}

func serializeByPreOrder<T>(_ node: BinaryNode<T>) -> [T?] {
    var array: [T?] = []
    node.fullTraversePreOrder {
        array.append($0)
    }
    return array
}

func deserializeByPreOrder<T>(_ array: inout [T?]) -> BinaryNode<T>? {
    guard !array.isEmpty, let value = array.removeFirst() else {
        return nil
    }
    
    let node = BinaryNode(value: value)
    node.leftChild = deserializeByPreOrder(&array)
    node.rightChild = deserializeByPreOrder(&array)
    return node
}

func serializeByInOrder<T>(_ node: BinaryNode<T>) -> [T?] {
    var array: [T?] = []
    node.fullTraverseInOrder {
        array.append($0)
    }
    return array
}

/**
 InOrder 序列化后无法反序列化，例如序列化的数据为: [nil, 2, nil, 1, nil]
 它可能长这样
 ![DeserializeInOrder1](DeserializeInOrder1.png)
 也有可能长这样
 ![DeserializeInOrder2](DeserializeInOrder2.png)
 */
func deserializeByInOrder<T>(_ array: inout [T?]) -> BinaryNode<T>? {
    return nil
}

func serializeByPostOrder<T>(_ node: BinaryNode<T>) -> [T?] {
    var array: [T?] = []
    node.fullTraversePostOrder {
        array.append($0)
    }
    return array
}

func deserializeByPostOrder<T>(_ array: inout [T?]) -> BinaryNode<T>? {
    guard !array.isEmpty, let value = array.removeFirst() else {
        return nil
    }
    
    let node = BinaryNode(value: value)
    node.rightChild = deserializeByPostOrder(&array)
    node.leftChild = deserializeByPostOrder(&array)
    return node
}

func makeTree() -> BinaryNode<Int> {
    let root = BinaryNode(value: 15)
    let ten = BinaryNode(value: 10)
    let five = BinaryNode(value: 5)
    let twelve = BinaryNode(value: 12)
    let twentyFive = BinaryNode(value: 25)
    let seventeen = BinaryNode(value: 17)

    root.leftChild = ten
    root.rightChild = twentyFive
    ten.leftChild = five
    ten.rightChild = twelve
    twentyFive.leftChild = seventeen

    return root
}

example(of: "tree diagram") {
    let tree = makeTree()
    print(tree)
}

example(of: "serialize by pre-order") {
    let tree = makeTree()
    let array = serializeByPreOrder(tree)
    print(array)
}

example(of: "serialize by in-order") {
    let tree = makeTree()
    let array = serializeByInOrder(tree)
    print(array)
}

example(of: "serialize by post-order") {
    let tree = makeTree()
    let array = serializeByPostOrder(tree)
    print(array)
}

example(of: "deserialize by pre-order") {
    let tree = makeTree()
    var array = serializeByPreOrder(tree)
    print(array)
    let deserializeTree = deserializeByPreOrder(&array)
    print(deserializeTree!)
}

example(of: "deserialize by in-order") {
    print("can't deserialize by in-order")
}

example(of: "deserialize by post-order") {
    let tree = makeTree()
    var array = serializeByPostOrder(tree)
    print(array)
    var reversedArray = Array(array.reversed())
    let deserializeTree = deserializeByPostOrder(&reversedArray)
    print(deserializeTree!)
}
