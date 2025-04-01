/* Extensions can:
 - Add computed props and computed type props
 - Define instance methods and type methods
 - Provide initializers
 - Define subscripts
 - Define and use nested types
 - Make existing type conform to a protocol
 */

// CAN ADD BUT NOT OVERRIDE

protocol SomeProtocol {
    
}

protocol AnotherProtocol {
    
}

class SomeType {}

extension SomeType: SomeProtocol, AnotherProtocol {
    
}

//Computed Properties

extension Double {
    
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
    
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")

//Initializers

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}


let centerRect = Rect(center: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Int {
    func repetitions(task: () -> Void) {
           for _ in 0..<self {
               task()
           }
       }
}


3.repetitions {
    print("Suck some dick")
}


//Mutating Instance Methods
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()
print(someInt)


//Subscripts
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

print(746381295[0])

for i in 0..<5 {
    print(746381295[i])
}

//Nested Types
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}


func printIntegerKinds(_ numbers: [Int]) {
    for num in numbers {
        switch num.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}


printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
