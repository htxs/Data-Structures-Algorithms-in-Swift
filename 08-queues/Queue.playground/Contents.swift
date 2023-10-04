example(of: "QueueArray") {
    var queue = QueueArray<String>()
    queue.enqueue("Ray")
    queue.enqueue("Brian")
    queue.enqueue("Eric")
    
    print("Queue elements: \(queue)")
    
    if let peekedValue = queue.peek {
        assert("Ray" == peekedValue)
        print("Peeked: \(peekedValue)")
    }
    
    queue.dequeue()
    print("After dequeue elements: \(queue)")
}
