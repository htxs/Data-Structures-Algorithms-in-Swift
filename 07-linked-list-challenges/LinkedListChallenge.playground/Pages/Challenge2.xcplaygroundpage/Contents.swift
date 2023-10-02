/*:
 [Previous Challenge](@previous)
 ## Challenge 2: Find the middle node
 
 Create a function that finds the middle node of a linked list.
 */
func getMiddle<T>(_ list: LinkedList<T>) -> Node<T>? {
    var fast = list.head
    var slow = list.head
    
    while let nextFast = fast?.next {
        fast = nextFast.next
        slow = slow?.next
    }
    
    return slow
}

example(of: "getting the middle node") {
    var list = LinkedList<Int>()
    list.push(4)
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Original list: \(list)")
    
    if let middleNode = getMiddle(list) {
        print("The middle node: \(middleNode.value)")
    }
}

//: [Next Challenge](@next)
