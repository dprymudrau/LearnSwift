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
