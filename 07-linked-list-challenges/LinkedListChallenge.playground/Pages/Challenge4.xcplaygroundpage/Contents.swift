/*:
 [Previous Challenge](@previous)
 ## Challenge 4: Merge two lists
 
 Create a function that takes two sorted linked lists and merges them into a single sorted linked list. Your goal is to return a new linked list that contains the nodes from two lists in sorted order. You may assume the sort order is ascending.
 */
func mergeSorted<T: Comparable>(_ left: LinkedList<T>, _ right: LinkedList<T>) -> LinkedList<T> {
    guard !left.isEmpty else {
        return right
    }
    guard !right.isEmpty else {
        return left
    }
    
    var newHead: Node<T>?
    var newTail: Node<T>?
    
    var currentLeft = left.head
    var currentRight = right.head
    
    // 记录最小值作为新链表的头节点
    if let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            newHead = leftNode
            currentLeft = leftNode.next
        } else {
            newHead = rightNode
            currentRight = rightNode.next
        }
        newTail = newHead
    }
    
    while let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            newTail?.next = leftNode
            currentLeft = leftNode.next
        } else {
            newTail?.next = rightNode
            currentRight = rightNode.next
        }
        newTail = newTail?.next
    }
    
    // 如果 left 还有剩余节点，则全部链接到新的 tail 节点
    if let leftNodes = currentLeft {
        newTail?.next = leftNodes
    }
    
    // 如果 right 还有剩余节点，则全部链接到新的 tail 节点
    if let rightNodes = currentRight {
        newTail?.next = rightNodes
    }
    
    var list = LinkedList<T>()
    list.head = newHead
    // newTail 目前还不是最后一个节点，需要移动到最后
    while let next = newTail?.next {
        newTail = next
    }
    list.tail = newTail
    
    return list
}

example(of: "merging two lists") {
    var list1 = LinkedList<Int>()
    list1.push(11)
    list1.push(10)
    list1.push(4)
    list1.push(1)
    var list2 = LinkedList<Int>()
    list2.push(6)
    list2.push(3)
    list2.push(2)
    list2.push(-1)
    
    print("Left list: \(list1)")
    print("Right list: \(list2)")
    let mergedList = mergeSorted(list1, list2)
    print("Merged list: \(mergedList)")
    let tailValue = String(describing: mergedList.tail?.value)
    print("Merged list tail node: \(tailValue)")
}

//: [Next Challenge](@next)
