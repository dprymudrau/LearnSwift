//Closure Expressions
//The Sorted Method
let names = ["Chris", "Alex", "Ewa", "Barry", "Dniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by:backward)

//Closure Expression Syntax
reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 > s2})

//Inferring Type From Context

reversedNames = names.sorted(by: {s1, s2 in return s1 > s2})


//Implicit Returns from Single-Expression Closures
reversedNames = names.sorted(by: {s1, s2 in s1 > s2})

//Shorthand Argument Names
reversedNames = names.sorted(by: { $0 > $1 })

//Operator Methods
reversedNames = names.sorted(by: >)

//Trailing Closures
func someFunctionThatTakesAClosure(closure: () -> Void) {
    print("This function takes closure")
    closure()
}

someFunctionThatTakesAClosure(closure: {
    print("Default closure")
})

someFunctionThatTakesAClosure {
    print("Trailing closure")
}

reversedNames = names.sorted { $0 > $1 }


let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
        
    } while number > 0
    return output
}

print(strings, terminator: "\n")

/* func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
    if let picture = download("photo.jpg", from: server) {
        completion(picture)
    } else {
        onFailure()
    }
}

loadPicture(from: someServer) { picture in
    someView.currentPicture = picture
} onFailure: {
    print("Couldn't dowload the next picture.")
} */

//Capturing Values

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

print(incrementByTen())
print(incrementByTen())
print(incrementByTen())

let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementBySeven())
print(incrementByTen())

//Closures Are Reference Types
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
print(incrementByTen())

//Escaping Closures
//var completionHandlers: [() -> Void] = []
//
//func someFunctionWithEscapingClosure(completionHandeler: @escaping () -> Void) {
//    completionHandlers.append(completionHandeler)
//}
//
//func someFunctionWithNonescapingClosure(closure: () -> Void) {
//    closure()
//}
//
//class SomeClass {
//    var x = 10
//    func doSomething() {
//        someFunctionWithEscapingClosure { self.x = 100 }
//        someFunctionWithNonescapingClosure { x = 200}
//    }
//}
//
//let instance = SomeClass()
//instance.doSomething()
//print(instance.x)
//
//completionHandlers.first?()
//print(instance.x)
//
//class SomeOtherClass {
//    var x = 10
//    func doSomething() {
//        someFunctionWithEscapingClosure {
//            [self] in x = 100
//        }
//        someFunctionWithNonescapingClosure { x = 200}
//    }
//}
//
//struct SomeStruct {
//    var x = 10
//    mutating func doSomething() {
//        someFunctionWithNonescapingClosure { x = 20 }
//        someFunctionWithEscapingClosure { x = 100 }
//    }
//}

//Autoclosures

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())!")

print(customersInLine.count)

//same behavior
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: { customersInLine.remove(at: 0)})
print(customersInLine.count)

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: customersInLine.remove(at: 0))

customersInLine = ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
@MainActor
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
