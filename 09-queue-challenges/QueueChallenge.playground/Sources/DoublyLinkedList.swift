public class Node<T> {
    
    public var value: T
    public var next: Node<T>?
    public var previous: Node<T>?
    
    public init(value: T) {
        self.value = value
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        String(String(describing: value))
    }
}

public class DoublyLinkedList<T> {
    
    private var head: Node<T>?
    private var tail: Node<T>?
    
    public init() { }
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public var first: Node<T>? {
        head
    }
    
    public var last: Node<T>? {
        tail
    }
    
    public func prepend(_ value: T) {
        let newNode = Node(value: value)
        
        guard let headNode = head else {
            // head 为空，则链表为空
            head = newNode
            tail = newNode
            return
        }
        
        newNode.previous = nil
        newNode.next = headNode
        headNode.previous = newNode
        head = newNode
    }
    
    public func append(_ value: T) {
        let newNode = Node(value: value)
        
        guard let tailNode = tail else {
            // tail 为空，则链表为空
            head = newNode
            tail = newNode
            return
        }
        
        // 将新节点与 tail 节点连接起来
        newNode.previous = tailNode
        tailNode.next = newNode
        tail = newNode
    }
    
    public func remove(_ node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            // node 为非头节点
            prev.next = next
        } else {
            // node 为头节点
            head = next
        }
        
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    public var description: String {
        guard !isEmpty else {
            return "Empty List"
        }
        var string = ""
        var current = head
        while let node = current {
            string.append("\(node.value) -> ")
            current = node.next
        }
        return string + "end"
    }
}

public class LinkedListIterator<T>: IteratorProtocol {
    
    private var current: Node<T>?
    
    init(node: Node<T>?) {
        current = node
    }
    
    public func next() -> Node<T>? {
        defer {
            current = current?.next
        }
        return current
    }
}

extension DoublyLinkedList: Sequence {
    
    public func makeIterator() -> LinkedListIterator<T> {
        LinkedListIterator(node: head)
    }
}
