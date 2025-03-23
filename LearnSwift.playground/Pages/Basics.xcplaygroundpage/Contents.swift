//Declaring Constants and Variables


//let maximumNumberOfLoginAttempts = 10
var  currentLoginAttempts = 0

var environment = "development"
let maximumNumberOfLoginAttempts: Int
// maximumNumberOfLoginAttempts has no value

if environment == "development" {
    let maximumNumberOfLoginAttempts = 100
} else {
    let maximumNumberOfLoginAttempts = 10
}
// Now max num of login attemps can be read

var x = 0.0, y = 0.0, z = 0.0

//Type Annotations

var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: String

//Naming Constants and Variables
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

let `private` = 123

welcomeMessage = "Bonjour!"

let languageName = "Swift"
//languageName = "Swift++" - Error

//Printing Constants and Variables
//print(_:separator:terminator)

print(welcomeMessage)
print("The current value of x is \(x)")

//Comments
//This is a comment.

/* This is also a comments
 but is written over multiple lines. */

/* This is the start of the firs multiline comment.
    /* This is the second, nested multiline comment. */
 This is the end of the first multiline comment. */

//Semicolons
let cat = "🐈"; print(cat)

//Integers
//Swift provides integers in 8, 16, 32, and 64 bit forms

//Integer Bounds
let minValue = UInt8.min
let maxValue = UInt8.max

print("Min value of 8-bit int \(minValue) and max value is \(maxValue)")

//Int
//For 32-bit platform Int is the same size as Int32
//For 64-bit platforms Int is the same size as Int64

//UInt
//is Unsigned integer and has same size as platform(unsigned means non negative but use Int in biggest amount of cases)


//Floating-Point Numbers
//Double represents 64-bit numbers(15 decimal digits)
//Float represents 32-bit numbers(6 decimal digits)

//Type Safety and Type Interface
//default type safety as in Java

//Numeric Literals
//All of following vars have same 17 integer value
let decimalInteger = 17
let binaryInteger = 0b10001 // 17 in binary notation
let octalInteger = 0o21 // 17 in octal notation
let hexadecimalInteger = 0x11 // 17 in hexadecimalnotation

//1.25e2 means 1.25 x 10^2, or 125.0
//1.25e-2 means 1.25 x 10^-2 or 0.0125

//0xFp2 means 15 x 2^2 or 60.0
//0xFp-2 means 15 x 2^-2 or 3.75

//all of them are 12.1875
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//Integer Conversion
// let canNotBeNegative: UInt8 = -1 - cant be negative

// let tooBig: Int8 = Int8.max + 1 - bigger that range of Int8
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one) // cannot do twoThousand + one

//Integer and Floating-Point Conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi)
//to integer used turnications which means that 4.75 will be 4 in integer

//Type Aliases
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min


//Booleans
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrigble")
}

let i = 1
if i == 1 {
    //this is how we use boolean
}

//Tuples
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The satus code is \(statusCode)")
print("The status message is \(statusMessage)")

//To ignore some of values of tuple
let (justStatusCode, _) = http404Error
print("The status code is \(justStatusCode)")

print("The status code is \(http404Error.0) and message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

//Optionals
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

//nil
var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String?
//by default it will be nil

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

//nil can't be used with non optional constants and variables

//Optional Binding
/* if let <#contantName#> = <#someOptionsl#> {
    <#statements#>
} */

if let actualNumber = Int(possibleNumber) {
    print("The sting \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}

let myNumber = Int(possibleNumber)

if let myNumber = myNumber {
    print("My number is \(myNumber)")
}

if let myNumber {
    print("My number is \(myNumber)")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

//Same as

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print ("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

//Providing a Fallback Value
let name: String? = nil
let greeting = "Hello, " + (name ?? "friend") + "!"
print(greeting)

//Force Unwrappping
let possibleNumberSecond = "123"
let convertedNumberSecond = Int(possibleNumberSecond)

let number = convertedNumberSecond!

guard let number = convertedNumberSecond else {
    fatalError("The number was invalid")
}

//Implicitly Unwrapped Optionals
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString

if assumedString != nil {
    print(assumedString!)
}

if let definiteString = assumedString {
    print(definiteString)
}


//Error Handling
func canThrowError() throws {
    // this function may or may not throw an error
}

do {
    try canThrowError()
    //no error was thrown
} catch {
    // an error was thrown
}


//Debugging with Assertions
let age = -3
//assert(age >= 0, "A person's age can't be less than zero.")
//assert(age >= 0)

/* if age > 10 {
 print("You can ride the roller-coaster or the ferris weel.")
 } else if age >= 0 {
 print("You can ride ferris wheel.")
 } else {
 assertionFailure("A person's age can't be less than zero.")
 }
 */

//Enforcing Preconditions
precondition(age >= 0, "A person's age can't be less than zero.")
