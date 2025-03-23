//For-In Loops
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)")
}

let numberOfLegs = ["spider": 8, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

let minutes = 60
for tickMark in 0..<minutes {
    
}

let minuteInterval = 5
let strideInterval = stride(from: 0, to: minutes, by: minuteInterval)
for tickMark in strideInterval {
    print(tickMark)
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    print("render the tick mark every \(hourInterval) hours at \(tickMark)")
}

//While Loops
let finalSquare = 25
var board = [Int](repeating:0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
while square < finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    square += diceRoll
    
    if square < board.count {
        square += board[square]
    }
}
print("Game over")

//Repeat-While
square = 0
diceRoll = 0
repeat {
    square += board[square]
    diceRoll += 1
    if diceRoll == 7 {diceRoll = 1}
    square += diceRoll
} while square < finalSquare
print("Game over")

//Conditional Statements
//If
var temperatureInFarenheit = 30
if temperatureInFarenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

temperatureInFarenheit = 40

if temperatureInFarenheit <= 32 {
    print("It's very cold. Consider wering a scarf.")
} else {
    print("It's not that cold. Wear a T-shirt")
}

temperatureInFarenheit = 90

if temperatureInFarenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFarenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a T-shirt")
}

if temperatureInFarenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFarenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}

let temperatureCelsius = 25
let weatherAdvice: String

if temperatureCelsius <= 0 {
    weatherAdvice = "It's very cold. Consider wearing a scarf."
} else if temperatureCelsius >= 30 {
    weatherAdvice = "It's really warm. Don't forget to wear sunscreen."
} else {
    weatherAdvice = "It's not that cold. Wear a T-shirt"
}

print(weatherAdvice)


let advice = if temperatureCelsius <= 0 {
    "It's very cold. Consider wearing a scarf."
} else if temperatureCelsius >= 30 {
    "It's really warm. Don't forget to wear sunscreen."
} else {
    "It;s not that cold. Wear a T-shirt"
}

print(advice)

let freezeWarning: String? = if temperatureCelsius <= 0 {
    "It's below freezing. Watch for ice!"
} else {
    nil
}

let heatWarning = if temperatureCelsius >= 40 {
    "It's really warm. Stay hydrated."
} else {
    nil as String?
}

//Switch
let someCharacter: Character = "c"

switch someCharacter {
case "a":
    print("The first letter of the Latin alphabet")
case "z":
    print("The last letter of the Latin alphabet")
default:
    print("Some other character")
}

let anotherCharacter: Character = "a"
let message = switch anotherCharacter {
case "a" :
    "The first letter of the Latin alphabet"
case "z":
    "The last letter of the Latin alphabet"
default:
    "Some other character"
}

print(message)

//No Implicit Fallthrough
//switch anotherCharacter {
//case "a":
//case "A":
//    print("The letter A")
//default:
//    print("Not the letter A")
//} - produces compile time error as case should containt some code

switch anotherCharacter {
case "a", "A":
    print( "The letter A")
default:
    print("Not the letter A")
}

//Interval Matching
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozes of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

print("There are \(naturalCount) \(countedThings)")

//Tuples
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case(_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default :
    print("\(somePoint) is outside the box")
}

//Value Bindings
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case(0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

//Where
let yetAnotherPoint = (1, -1)

switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print ("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitary point")
}

//Compound Cases
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) isn't a vowel or a consonant")
}

let stillAnotherPoint = (0, 9)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

//Control Transer Statements
//Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for char in puzzleInput {
    if charactersToRemove.contains(char) {
        continue
    }
    puzzleOutput.append(char)
}
print(puzzleOutput)

//Break
//Stops for loop and makes code go to the next parts after loop

let numberSymbol: Character = "三"
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}

if let intValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(intValue)")
} else {
    print("An integer value couldn't be found for \(numberSymbol).")
}

//Fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number and also"
    fallthrough
default:
    description += " an integer"
}
print(description)

//Labeled Statemens
board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
square = 0
diceRoll = 0

gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}

print("Game over!")

//Early Exit

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the wether is nice near you.")
        return
    }
    
    print("I hope the wether is nice in \(location)")
}

greet(person: ["name": "John"])
greet(person: ["name": "Jane", "location": "Cupertino"])

//Deferred Actions

var score = 1
if score < 10 {
    defer {
        print(score)
    }
    score += 5
}

score = 3

if score < 100 {
    score += 100
    defer {
        score -= 100
    }
    
    print(score)
}

if score < 10 {
    defer {
        print(score)
    }
    defer {
        print("The score is:")
    }
    score += 5
}

// Checking API Availability
if #available(iOS 10, macOS 10.12, *) {
    
} else {
    
}

@available(macOS 10.12, *)
struct ColorPreference {
    var bestColor = "blue"
}

func chooseBestColor() -> String {
    guard #available(macOS 10.12, *) else {
        return "gray"
    }
    let colors = ColorPreference()
    return colors.bestColor
}

print(chooseBestColor())

if #available(iOS 10, *) {
    
} else {
    //Fallback code
}

if #unavailable(iOS 10) {
    //Fallback code
}
