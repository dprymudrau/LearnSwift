//Deinitializers in Action
class Bank {
    
    private static var coinsInBank: Int = 10_000
    
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receive(coins: Init) {
        coinsInBank += coins
    }
    
    static func getCoinsAmount() -> Int {
        return coinsInBank
    }
}

class Player {
    
    var coinsInPurse: Int
    
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse)")

print("There are now \(Bank.getCoinsAmount()) coins left in the bank")


playerOne = nil
print("PlayerOne has left the game")

print("The bank now has \(Bank.getCoinsAmount()) coins")
