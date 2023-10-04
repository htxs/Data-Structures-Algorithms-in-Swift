public struct QueueArray<T>: Queue {
    
    private var storage: [T] = [T]()
    public init() { }
    
    public var isEmpty: Bool {
        return storage.isEmpty
    }
    
    public var peek: T? {
        storage.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        storage.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        isEmpty ? nil : storage.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        String(String(describing: storage))
    }
}
