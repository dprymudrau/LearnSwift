//Representing and Throwing Errors
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}


//Propagating Errors Using Throwing Functions
// func canThrowErrors() throws -> String
//func cannotThrowErrors() -> String

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice" : "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    
    try vendingMachine.vend(itemNamed: snackName)
}


//try buyFavoriteSnack(person: "Alice", vendingMachine: VendingMachine()) - will ge error as 0 coins in vending machine

struct PurchasedSnack {
    
    let name: String
    
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}


//Handling errors using Do-Catch

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection")
} catch VendingMachineError.outOfStock {
    print("Out of Stock")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}

func nourish(with item: String) throws {
    var vendingMachine = VendingMachine()
    vendingMachine.coinsDeposited = 8
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Couldn't buy that form the vending machine")
    }
}

do {
    try nourish(with: "Best-Flavored Chips")
} catch {
    print("Unexpected non vending machine related error: \(error)")
}


func eat(item: String) throws {
    var vendingMachine = VendingMachine()
    vendingMachine.coinsDeposited = 8
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch VendingMachineError.invalidSelection, VendingMachineError.insufficientFunds, VendingMachineError.outOfStock {
        print("Invalid selection, out of stock, or not enough money.")
    }
}

do {
    try eat(item: "Best-Flavored Chips")
} catch {
    print("Unexpected non vending machine related error: \(error)")
}


//Converting Errors to Optional Values
func someThrowingFunction() throws -> Int {
    throw VendingMachineError.outOfStock
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

func doSmth() -> Int? {
    if let a = try? someThrowingFunction() { return a }
    return nil
}

//Disabling Error Propagation
// let b = try! someThrowingFunction() - there will get arror without handling

//Specifying the Error Type

enum StatisticsError: Error {
    case noRatings
    case invalidRating(Int)
}

func summarize(_ ratings: [Int]) throws(StatisticsError) {
    guard !ratings.isEmpty else {
        throw .noRatings
    }
    
    var counts = [1: 0, 2: 0, 3: 0]
    for rating in ratings {
        guard rating > 0 && rating <= 3 else { throw .invalidRating(rating)}
        counts[rating]! += 1
    }
    
    print("*", counts[1]!, "-- **", counts[2]!, "-- ***", counts[3]!)
}


func someThrowingFunction1() throws {
    let ratings = [1, 2, 3, 2, 2, 1]
    try summarize(ratings)
}

func someAnotherTrowningFunction1() throws(any Error) {
    let ratings = [1, 2, 3, 2, 2, 1]
    try summarize(ratings)
}


func nonThrowingFunction() throws(Never) {
    //never thows error
}

let ratings: [Int] = []
do throws(StatisticsError) {
    try summarize(ratings)
} catch {
    switch error {
    case .noRatings:
        print("No ratings available")
    case .invalidRating(let rating):
        print("Invalid rating \(rating)")
    }
}

//Or
do {
    try summarize(ratings)
} catch {
    switch error {
    case .noRatings:
        print("No ratings available")
    case .invalidRating(let rating):
        print("Invalid rating \(rating)")
    }
}

//func processFile(filename: String) throws {
//    if exists(filename) {
//        let file = open(filename)
//        defer {
//            close(file)
//        }
//        while let line = try file.readline() {
//
//        }
//    }
//}
// defer - will be executed even if error will be thrown(not runtime one)
