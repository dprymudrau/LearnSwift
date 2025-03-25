//Stored Properties
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

//Stored Propeties of Constant Structure Instances
let rnageOfFourItems = FixedLengthRange(firstValue : 0, length: 4)
// rnageOfFourItems.firstValue = 6 // should be an error as this is constant part

//Lazy Stored Properties
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
}



let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")


print(manager.importer.fileName)


//Stored Properties and Instance Variables
//Computed Properties
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size .width / 2)
            let centerY = origin.y + (size .height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size .width / 2)
            origin.y = newCenter.y - (size .height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now \(square.origin.x), \(square.origin.y)")


//Shorthand Setter declaration
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//Shorthand Getter Declaration
struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}


//Read-Only Computed Properties

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

//Property Observers
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200

stepCounter.totalSteps = 360

stepCounter.totalSteps = 896

//Property Wrappers
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
    @TwelveOrLess var  lenght: Int
    @TwelveOrLess var height: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)

rectangle.height = 10
print(rectangle.height)

rectangle.height = 24
print(rectangle.height)


struct AnotherSmallRectangle {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}

//Setting Initial Values for Wrapped Properties
@propertyWrapper
struct SmallNumeber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }
    
    init() {
        maximum = 12
        number = 0
    }
    
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle {
    @SmallNumeber var height: Int
    @SmallNumeber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)

struct UnitRectangle {
    @SmallNumeber var height: Int = 1
    @SmallNumeber var width: Int = 1
}

var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)


struct NarrowRectangle {
    @SmallNumeber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumeber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)

struct MixedRectangle {
    @SmallNumeber var height: Int = 1
    @SmallNumeber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)

mixedRectangle.height = 20
print(mixedRectangle.height)

//Projecting a Value From Property Wrapper
@propertyWrapper
struct AnotherSmallNumber {
    private var number: Int
    private(set) var projectedValue: Bool
    
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
    
    init() {
        self.number = 0
        self.projectedValue = false
    }
}

struct SomeStructure {
    @AnotherSmallNumber var someNumber: Int
}

var someStructure = SomeStructure()
someStructure.someNumber = 4
print(someStructure.$someNumber)

someStructure.someNumber = 55
print(someStructure.$someNumber)

enum AnotherSize {
    case small, large
}

struct SizedRectangle {
    @AnotherSmallNumber var height: Int
    @AnotherSmallNumber var width: Int
    
    mutating func resize(to size: AnotherSize) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}


//Global and Local Variables
func someFunction() {
    //Only allowed for local variables
    @SmallNumeber var myNumber: Int = 0
    
    myNumber = 10
    
    myNumber = 24
}

//Type Properties
struct SomeStructureWithStatic {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumerationWithStatic {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClassWithStatic {
    static var storedTypeProperty = "Some value."
    
    static var computedTypeProperty: Int {
        return 27
    }
    
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}


//Querying and Setting Type Properties

print(SomeStructureWithStatic.storedTypeProperty)
SomeStructureWithStatic.storedTypeProperty = "Another value."
print(SomeStructureWithStatic.storedTypeProperty)

print(SomeEnumerationWithStatic.computedTypeProperty)
print(SomeClassWithStatic.computedTypeProperty)

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
