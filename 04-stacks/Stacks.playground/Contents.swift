/**
 Key points
 * A stack is a LIFO, last-in first-out, data structure.
 * Despite being so simple, the stack is a key data structure for many problems.
 * The only two essential operations for the stack are the push method for adding elements and the pop method for removing elements.
 */
example(of: "using a stack") {
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    
    print(stack)
    
    if let poppedValue = stack.pop() {
        assert(4 == poppedValue)
        print("Popped: \(poppedValue)")
    }
}

example(of: "initializing a stack from an array literal") {
    var stack: Stack = [1.0, 2.0, 3.0, 4.0]
    
    print(stack)
    
    if let poppedValue = stack.pop() {
        assert(4.0 == poppedValue)
        print("Popped: \(poppedValue)")
    }
}

example(of: "initializing a stack from an array") {
    let array = ["A", "B", "C", "D"]
    var stack = Stack(array)
    
    print(stack)
    
    if let poppedValue = stack.pop() {
        assert("D" == poppedValue)
        print("Popped: \(poppedValue)")
    }
}

