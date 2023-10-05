/*:
 [Previous Challenge](@previous)
 ## Challenge 4: Reverse Queue
 
 Implement a method to reverse the contnets of a queue.
 */
extension QueueArray {
    public func reversed() -> QueueArray {
        var queue = self
        var stack = Stack<T>()
        while let element = queue.dequeue() {
            stack.push(element)
        }
        while let element = stack.pop() {
            queue.enqueue(element)
        }
        return queue
    }
}

example(of: "Reverse Queue") {
    var queue = QueueArray<Int>()
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)
    queue.enqueue(4)
    queue.enqueue(5)
    
    print("Original queue: \(queue)")
    
    let reversedQueue = queue.reversed()
    
    print("Reversed queue: \(reversedQueue)")
}

//: [Next Challenge](@next)
