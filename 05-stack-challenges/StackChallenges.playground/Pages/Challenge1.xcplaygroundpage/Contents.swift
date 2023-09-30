/*:
 # Stack Challenges

 ## #1. Reverse an Array
 
 Create a function that use a stack to print the contents of an array in reversed order.
 */
let array: [Int] = [1, 2, 3, 4, 5]

func printInReverse<T>(_ array: [T]) {
    var stack = Stack<T>()

    for value in array {
        stack.push(value)
    }

    while let value = stack.pop() {
        print(value)
    }
}

printInReverse(array)
//: [Next Challenge](@next)
