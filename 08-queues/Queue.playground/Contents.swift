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

example(of: "QueueLinkedList") {
    var queue = QueueLinkedList<String>()
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

example(of: "QueueRingBuffer") {
    var queue = QueueRingBuffer<String>(count: 10)
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

example(of: "QueueStack") {
    var queue = QueueStack<String>()
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
