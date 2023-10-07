public struct Queue<T> {
    
    private var outStack: [T] = []
    private var inStack: [T] = []
    public init() { }
    
    public var isEmpty: Bool {
        outStack.isEmpty && inStack.isEmpty
    }
    
    public var peek: T? {
        !outStack.isEmpty ? outStack.last : inStack.first
    }
    
    public private(set) var count = 0
    
    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {
        count += 1
        inStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack.removeAll()
        }
        let value = outStack.popLast()
        if value != nil {
          count -= 1
        }
        return value
    }
}
