//Defining and Calling Functions
func greet(person: String) -> String {
    return "Hello, \(person)!"
}
print(greet(person: "Anna"))
print(greet(person: "Brian"))


//Function without Parameters
func sayHelloWorld() -> String {
    return "Hello, World!"
}

print(sayHelloWorld())

//Functions With Multiple Parameters
func greetAgain(person: String) -> String {
    return "Hello again, \(person)!"
}
func greet(person: String, alreadyGreeted: Bool) -> String {
    return alreadyGreeted ? greetAgain(person: person) : greet(person: person)
}

print (greet(person: "Tim", alreadyGreeted: true))

//Functions without return values
func greetWithoutReturnValue(person: String) {
    print("Hello, \(person)")
}

greetWithoutReturnValue(person: "Alice")

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "Hello, World!")
printWithoutCounting(string: "Hello, Wolrd!")


//Function with multiple returning values
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

print(minMax(array: [1, 5, 4, 10, 99, -99]))

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

//Optional Tuple Return Types
func minMaxOptional(array: [Int]) -> (min: Int, max: Int)? {
    guard !array.isEmpty else {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value  < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

if let boundsOpt = minMaxOptional(array:[8, -6, 2]) {
    print("min is \(boundsOpt.min) and max is \(boundsOpt.max)")
}


//Functions WIth an Implicit Return

func greeting(for person: String) -> String {
    "Hello, \(person)!"
}

print(greeting(for: "Me"))
//Previous is the same as following
func anotherGreeting(for person: String) -> String {
    return "Hello, \(person)!"
}

print(anotherGreeting(for: "Me"))

//Function Argumaent Labels and Parameter Names
func someFunction(firstParameterName: Int, secondParameter: Int) {
    
}


//Specifying ArgumentsLabels
func someFunction(argumentLabel parameterName: Int) {
    
}

func greetWithLabels(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}

print(greetWithLabels(person: "Me", from: "Cupertino"))

//Ommit Argument Labels

func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    
}

someFunction(1, secondParameterName: 2)

//Default Parameter Value

func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    
}

someFunction(parameterWithoutDefault: 3, parameterWithDefault: 4)
someFunction(parameterWithoutDefault: 3)

//Variadic Parameters
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

print(arithmeticMean(1, 2, 3, 4, 5))
print(arithmeticMean())

//In-Out Parameters
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//Function Types

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func printHelloWorld() {
    print("Hello, World!")
}


//Using Function Types

var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts

print("Result: \(mathFunction(2, 3))")

let anotherMathFunction = addTwoInts
print("Another math func: \(anotherMathFunction(2, 3))")

//Function Types as Parameter Types
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    if backward {
        return stepBackward
    }
    return stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}

print("zero!")


//Nested Functions

func chooseStepFunctionNestedInside(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1}
    return backward ? stepBackward : stepForward
}

currentValue = -4
let moveNearerToZeroNestedInside = chooseStepFunctionNestedInside(backward: currentValue > 0)

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZeroNestedInside(currentValue)
}

print("zero!")
