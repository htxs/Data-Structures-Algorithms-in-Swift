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
    
    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {
        inStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack.removeAll()
        }
        return outStack.popLast()
    }
}
