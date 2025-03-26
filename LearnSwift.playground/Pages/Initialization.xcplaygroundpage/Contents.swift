//Initializers
struct Fahrenheit {
    var temperature: Double
    
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Farenheit")

//Default Property Values
struct YetAnotherFahrenheit {
    var temperature = 32.0
}

//Customizing Initialization
 // Initialization Parameters
struct Celsius {
    var temeratureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temeratureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temeratureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temeratureInCelsius = celsius
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

//Parameter Names and Argument Labels
@propertyWrapper
struct ColorWrapper {
    private var rgbNumber = 0.0
    var wrappedValue: Double {
        get { return rgbNumber }
        set {
            if newValue < 0.0 {
                rgbNumber = 0.0
            } else if newValue > 1.0 {
                rgbNumber = 1.0
            }
        }
    }
}
struct Color {
    @ColorWrapper var red: Double
    @ColorWrapper var green: Double
    @ColorWrapper var blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//Initializer Parameters Withoud Argument Labels
//Refer to Celsius class as I already did that by myself

//Optional Property Types
class SurveyQuestion {
    
    var text: String
    var response: String? // will be automatically nil
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
    
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()

cheeseQuestion.response = "Yes, I do like cheese."

//Assign Constant Properties During Initialization
class YetAnotherSurveyQuestion {
    
    let text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let beetsQuestion = YetAnotherSurveyQuestion(text: "Do you like beets?")
beetsQuestion.ask()

beetsQuestion.response = "I also like beets. (But now with cheese.)"

//Default Initializers
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

//Memberwise Initializers for Structure Types
struct Size {
    var width = 0.0, height = 0.0
}

let twoByTwo = Size(width: 2.0, height: 2.0)

let zeroByTwo = Size(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height)

let zeroByZero = Size()
print(zeroByZero.width, zeroByZero.height)

//Initializer Delegation for Value Types
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    init() {}
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.width / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

//Class Inheritance and Initialization
//Initializer Inheritance and Overriding
class Vehicle {
    var numberOfWheels = 0
    var description : String {
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        // super.init() implicitly called here
        self.color = color
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")

//Automatic Initializer Inheritance
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}


let nameMeat = Food(name: "Meat")
let mysteryMeat = Food()

class RecipeIngredient: Food {
    
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
print(oneMysteryItem.quantity)

let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class FoodShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var breakfastList = [
    FoodShoppingListItem(),
    FoodShoppingListItem(name: "Bakon"),
    FoodShoppingListItem(name: "Eggs", quantity: 6)
]

breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}


//Failable Initializers
let wholeNumber: Double = 12345.0
let pi = 3.14159
if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
}

let valueChanged = Int(exactly: pi)

if valueChanged == nil {
    print("\(pi) conversion to Int doesn\t maintain value")
}

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")

if anonymousCreature == nil {
    print("The anonymous creature clouldn't be initialized")
}


//Failable Initializer for Enumeratuions

enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This isn't a defined temperature unit, so initialization failed.")
}

//Failable Initializers for Enumerations with Raw Value
enum AnotherTemperaturUnit: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

let anotherFahrenheitUnit = AnotherTemperaturUnit(rawValue: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let anotherUnknownUnit = AnotherTemperaturUnit(rawValue: "X")
if anotherUnknownUnit == nil {
    print("This isn't a defined temperature unit, so initialization failed.")
}

//Propagation of Initialization Failure
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize an unnamed item")
}

//Overriding a Failable Initializer
class Document {
    var name: String?
    
    init() {}
    
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    
    let defaultName = "[Untitled]"
    
    override init() {
        super.init()
        self.name = defaultName
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = defaultName
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

//Requored initializers
class SomeClass {
    required init() {
        
    }
}

class SomeSubclass: SomeClass {
    required init() {
        
    }
}


//Setting a Default Property Value with a Closure or Function
class YetSomeAnotherClass {
    let someProperty: Double = {
        return 0.0
    }()
}

struct Chessboard {
    
    let boardColors: [Bool] = {
        var temporaryBoard: [Bool] = []
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let chessboard = Chessboard()
print(chessboard.squareIsBlackAt(row: 0, column: 1))
print(chessboard.squareIsBlackAt(row: 7, column: 7))
