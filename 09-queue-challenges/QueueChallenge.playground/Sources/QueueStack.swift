public class QueueStack<T>: Queue {
    
    private var outStack: [T] = []
    private var inStack: [T] = []
    public init() { }
    
    public var isEmpty: Bool {
        outStack.isEmpty && inStack.isEmpty
    }
    
    public var peek: T? {
        !outStack.isEmpty ? outStack.last : inStack.first
    }
    
    public func enqueue(_ element: T) -> Bool {
        inStack.append(element)
        return true
    }
    
    public func dequeue() -> T? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack.removeAll()
        }
        return outStack.removeLast()
    }
}

extension QueueStack: CustomStringConvertible {
    public var description: String {
        String(describing: outStack.reversed() + inStack)
    }
}
