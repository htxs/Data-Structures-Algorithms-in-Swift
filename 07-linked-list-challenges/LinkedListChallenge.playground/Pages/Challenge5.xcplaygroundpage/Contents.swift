/*:
 [Previous Challenge](@previous)
 ## Challenge 5: Remove all occurrences of a specific element
 
 Create a function that removes all occurrences of a specific element from a linked list. The implementation is similar to the `remove(at:)` method that you implemented for the linked list.
 */
extension LinkedList where Value: Equatable {
    
    mutating func removeAll(_ value: Value) {
        // 处理头节点
        while let headNode = head, headNode.value == value {
            head = headNode.next
        }
        
        var prev = head
        var current = head?.next
        while let currentNode = current {
            if currentNode.value == value {
                // 待删除的值，则 prev 的 next 指向下一个节点（删除当前节点）
                prev?.next = currentNode.next
            } else {
                // 否则后移 prev 节点
                prev = current
            }
            // current 节点每次都后移
            current = current?.next
        }
        tail = prev
    }
}

example(of: "deleting duplicate nodes") {
    var list = LinkedList<Int>()
    list.push(4)
    list.push(3)
    list.push(3)
    list.push(3)
    list.push(1)
    
    print("Original list: \(list)")
    list.removeAll(3)
    print("After remove all 3: \(list)")
    let tailValue = String(describing: list.tail?.value)
    print("Tail node: \(tailValue)")
}
