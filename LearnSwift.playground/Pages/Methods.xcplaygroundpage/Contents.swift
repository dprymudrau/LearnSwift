class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()

counter.increment()
counter.increment(by: 5)
counter.reset()


//The self Property

class Incrementer {
    var increment = 0
    
    func incrementVyOne() {
        self.increment += 1
    }

}

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

//Modifying Value Type from Within Instance Methods

struct MutatingPoint {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var someMutatingPoint = MutatingPoint(x: 1.0, y: 1.0)
someMutatingPoint.moveBy(x: 2.0, y: 1.0)
print("The point is now ar (\(someMutatingPoint.x), \(someMutatingPoint.y))")

let someMutatingFixdePoint = MutatingPoint(x: 3.0, y: 3.0)
// someMutatingFixdePoint.moveBy(x: 1.0, y: 2.0) - can't be peroformed for constant

//Assigning to Self Within a Muraring Methood

struct AnotherPoint {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = AnotherPoint(x: self.x + deltaX, y: self.y + deltaY)
    }
}

enum TriStateSwitch {
    case off, low, high
    
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()


//Type Methods
class SomeClass {
    class func someTypeMethod() {
        
    }
}

SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Mosh")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 hsn't been unlocked")
}
