/*:
 # Tree Challenges
 ## Challenge 1: Print a tree in level order
 
 Print all the values in a tree in an order based on their level. Nodes in the same level should be printed on the same line.
 */

func makeTree() -> TreeNode<Int> {
    let tree = TreeNode(15)

    // Second level
    let one = TreeNode(1)
    tree.add(one)

    let seventeen = TreeNode(17)
    tree.add(seventeen)

    let twenty = TreeNode(20)
    tree.add(twenty)

    // Third level
    let one2 = TreeNode(1)
    let five = TreeNode(5)
    let zero = TreeNode(0)
    one.add(one2)
    one.add(five)
    one.add(zero)

    let two = TreeNode(2)
    seventeen.add(two)

    let five2 = TreeNode(5)
    let seven = TreeNode(7)
    twenty.add(five2)
    twenty.add(seven)

    return tree
}

func printEachLevel<T>(for tree: TreeNode<T>) {
    var queue = Queue<TreeNode<T>>()
    var nodesLeftInCurrentLevel = 0
    
    queue.enqueue(tree)
    while !queue.isEmpty {
        nodesLeftInCurrentLevel = queue.count
        while nodesLeftInCurrentLevel > 0 {
            guard let node = queue.dequeue() else { break }
            print("\(node.value) ", terminator: "")
            node.children.forEach { queue.enqueue($0) }
            nodesLeftInCurrentLevel -= 1
        }
        print()
    }
}

let tree = makeTree()
printEachLevel(for: tree)

//: [Next Challenge](@next)
