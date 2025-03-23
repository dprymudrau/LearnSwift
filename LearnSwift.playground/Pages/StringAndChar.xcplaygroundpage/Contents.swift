//String literals
let someString = "Some string literal value"

//Multiple String Literals
let quotation = """
The White Rabbit put on his speactacles. "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end: then stop.
"""

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

let softWrappedQuotation = """
The White Rabbit put on his spectacles. "Where shall I begin, \
please your Majesty?" he asked.
"Begin at the beginning, " the King said gravely, "and go on \
till you come to the end; then stop.
"""
print(softWrappedQuotation)

let lineBreaks = """

This string with a line break.
It also ends with a line break.

"""
print(lineBreaks)

let lineWithIndentation = """
    This line doesn't begin with whitespace.
        This line begins with one tabulation.
    This line doesn't begin with whitespace.
    """
print(lineWithIndentation)

//Special Characters in String Literals

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparlingHeart = "\u{1F49C}"
print(wiseWords)
print(dollarSign)
print(blackHeart)
print(sparlingHeart)

let threeDouleQuitationMars = """
Escaping the first quotation mark \"""
Escaping all thre qutatil marks \"\"\"
"""

//Extended String Delimiters
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

//Initializing an Empty String
var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here")
}


//String Mutability
var variableString = "Horse"
variableString += " and carriage" // allowed

let constantString = "Highlander"
//constantString += " and another Highlander" // not alloved

//Working with Characters

for character in "Dog!🐶" {
    print(character)
}

let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

//Concatinating Strings and Characters
let string1 = "hello"
let string2 = " there"

var welcome = string1 + string2

var instruction = "look over"
instruction += string2

welcome.append(exclamationMark)
print(welcome)

let badStrat = """
    one
    two
    """
let end = """
    three
    """

let goodStart = """
    one
    two
    
    """

print(badStrat + end)
print(goodStart + end)

//String Interpolation

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

print(#"Write an interpolated string in Swift using \(mutiplier)."#)

print(#"6 times 7 is \#(6 * 7)."#)

// Extended Grapheme Clusters
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"
let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
let regionalIndicatorForBY = "\u{1F1E7}\u{1F1FE}"


//Counting Characters

let unusalMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusalMenagerie.count) characters")

var word = "cafe"
print("the number of characters in \(word) is \(word.count)")

word += "\u{301}"

print("the number of characters in \(word) is \(word.count)")

//Accessing and Modifying a String
let greeting = "Guiten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

for index in greeting.indices {
    print(greeting[index], terminator: " ")
}

var welcomeScond = "hello"
welcomeScond.insert("!", at: welcomeScond.endIndex)

welcomeScond.insert(contentsOf: " there", at: welcomeScond.index(before:  welcomeScond.endIndex))

welcomeScond.remove(at: welcomeScond.index(before: welcomeScond.endIndex))
print(welcomeScond)

let range = welcomeScond.index(welcomeScond.endIndex, offsetBy: -6)..<welcomeScond.endIndex
welcomeScond.removeSubrange(range)

//Substrings
let greetingSecond = "Hello, world!"
let indexSecond = greetingSecond.firstIndex(of: ",") ?? greetingSecond.endIndex
let beginning = greetingSecond[..<indexSecond]

let newString = String(beginning)

//Comparing Strings
let quotationSecond = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotationSecond == sameQuotation {
    print("These two strings are considered equal")
}

let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two extended grapheme strings are considered as equal")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters aren't equivalent.")
}


//Prefix and Suffix Equality
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}

print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0

for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}

print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")


//Unicode Representation of String

let dogString = "Dog‼🐶"

//UTF-8 Representation
for codeUnit in dogString.utf8 {
    print("\(codeUnit)", terminator: " ")
}
print("")
//UTF-16 representation
for codeUnit in dogString.utf16 {
    print("\(codeUnit)", terminator: " ")
}
print("")
//Unicode Scalar Representation
for scalar in dogString.unicodeScalars {
    print("\(scalar.value)", terminator: " ")
}
print("")

for scalar in dogString.unicodeScalars {
    print(scalar)
}


