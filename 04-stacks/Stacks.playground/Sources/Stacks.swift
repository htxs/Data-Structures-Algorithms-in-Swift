/**
 Key points
 * A stack is a LIFO, last-in first-out, data structure.
 * Despite being so simple, the stack is a key data structure for many problems.
 * The only two essential operations for the stack are the push method for adding elements and the pop method for removing elements.
 */
public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public init() { }
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        storage.last
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
}

extension Stack: CustomDebugStringConvertible {
    public var debugDescription: String {
        """
        ----top----
        \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
        -----------
        """
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
