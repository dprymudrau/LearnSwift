//Creating an Empty Array
var someInts: [Int] = []
print("someInts is type of [Int] with \(someInts.count) items.")

someInts.append(3)
someInts = []

//Creating an Array with a Default Value
var threeDoubles = Array(repeating: 0.0, count: 3)

//Creating an Array by Adding Two Arrays Togethers
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

//Creating an Array with an Array Literal
var shoppingList: [String] = ["Eggs", "Milk"]
//or
var anotherShoppingList = ["Cucumber", "Tomato"]

//Accessing and Modifying an Array
print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
}

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList.insert("Maple Syrup", at: 0)
let mapleSyrup = shoppingList.remove(at: 0)
firstItem = shoppingList[0]
let apples = shoppingList.removeLast()


//Iterating Over an Array
for item in shoppingList {
    print(item)
}

for(index, value) in shoppingList.enumerated() {
     print("Item \(index + 1): \(value)")
}

//Sets

//Creating and Initializing an Empty Set
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
letters = []

//Creating a Set with an Array Literal
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
//or
var anotherFavoriteGenres: Set<String> = ["Jazz", "Blues", "Country"]

//Accessing and Modifying a Set
print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky here.")
}

//Iterating Over a Set
for genre in favoriteGenres {
    print(genre)
}

for genre in favoriteGenres.sorted() {
    print(genre)
}

//Fundamental Set Operations
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitsPrimeNumber: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()

oddDigits.subtracting(singleDigitsPrimeNumber).sorted()
oddDigits.symmetricDifference(singleDigitsPrimeNumber).sorted()

//Set Membership and Equality
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)


//Dictionaries
//Creating an Empty Dictionary
var nameOfIntegers: [Int: String] = [:]
nameOfIntegers[16] = "sixteen"
nameOfIntegers = [:]

//Creating a Dictionary with a Dictionary Literal
var airports: [String: String] = ["YYZ": "Toront Pearson", "DUB": "Dublin"]
//Or
var anotherAirports = ["YYZ": "Toront Pearson", "DUB": "Dublin"]

if airports.isEmpty {
    print("The airports disctionary is empty.")
} else {
    print("The airrports dictionary isn't empty.")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] {
    print("The name of airport is \(airportName).")
} else {
    print("That airport isn't in the airports dictionary.")
}

airports["APL"] = "Apple International"
airports["APL"] = nil
print(airports)

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airpot's name is \(removedValue)")
} else {
    print("The airports dictionary doesn't contain a value for Dublin")
}

//Iterating Over Dictionary

for (airportCode, airportName) in airports {
    print("\(airportCode) : \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
