/*:
 [Previous Challenge](@previous)
 ## Challenge 2: Parents and ownership
 
 Consider the original defination of a tree node:
 
 ```
 public class TreeNode<T> {
     public var value: T
     public var children: [TreeNode] = []
 
     public init(_ value: T) {
         self.value = value
     }
 }
 ```
 How can you modify this definition to include a parent? What considerations should you make about ownership?
 */
public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []
    
    // add a weak property
    public weak var parent: TreeNode?

    public init(_ value: T) {
        self.value = value
    }
}
