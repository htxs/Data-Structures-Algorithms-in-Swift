/*:
 [Previous Challenge](@previous)
 ## Challenge 3: Whose turn is it?
 
 Imagine that you are playing a game of Monopoly with your friends. The problem is that everyone always forgets whose turn it is! Create a Monopoly organizer that always tells you whose turn it is. Below is a protocol that you can conform to:
 */

public protocol BoardGameManager {
    associatedtype Player
    mutating func nextPlayer() -> Player?
}

extension QueueArray: BoardGameManager {
    public typealias Player = T
    
    public mutating func nextPlayer() -> Player? {
        // 出队一位玩家
        guard let player = dequeue() else {
            // 队列为空，则返回 nil
            return nil
        }
        // 将出对的玩家又入队放到队列尾部
        enqueue(player)
        return player
    }
}

example(of: "BoardGameManager") {
    var queue = QueueArray<String>()
    queue.enqueue("Vincent")
    queue.enqueue("Remel")
    queue.enqueue("Lukiih")
    queue.enqueue("Allison")
    
    print("Init queue state: \(queue)")
    
    print("===== boardgame =======")
    var player = queue.nextPlayer()
    print("next player: \(player!), queue state: \(queue)")
    player = queue.nextPlayer()
    print("next player: \(player!), queue state: \(queue)")
    player = queue.nextPlayer()
    print("next player: \(player!), queue state: \(queue)")
    player = queue.nextPlayer()
    print("next player: \(player!), queue state: \(queue)")
    player = queue.nextPlayer()
    print("next player: \(player!), queue state: \(queue)")
}

//: [Next Challenge](@next)
