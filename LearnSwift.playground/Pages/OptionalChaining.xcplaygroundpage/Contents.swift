//Optional Chaining as an Alternative toForced Unwrapping

class Residence {
    var numberOfRooms = 1
}
class Person {
    var residence: Residence?
}

let john = Person()

// let roomCount = john.residence!.numberOfRooms - runtime error

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s)")
} else {
    print("Unable to retrieve the number of rooms.")
}

john.residence = Residence()


if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s)")
} else {
    print("Unable to retrieve the number of rooms.")
}

//Defining Model classes for Optional Chaining
class Room {
    
    let name: String
  
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

class Apartment {
    
    var rooms: [Room] = []
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("The number of rooms os \(numberOfRooms)")
    }
    
    var address: Address?
}
class Human {
    var residence: Apartment?

}

let hugo = Human()
if let roomCount = hugo.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
hugo.residence?.address = someAddress
print(hugo.residence?.address as Any) // because residence is nil

func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}

hugo.residence?.address = createAddress()


//Calling Methods througn Optional Chaining

if hugo.residence?.printNumberOfRooms() != nil {
    print("It was possble to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

if(hugo.residence?.address = someAddress) != nil {
    print("It was possible to set address.")
} else {
    print("It was not possible to set address.")
}

//Accessing Subscript Through Optional Chaining

if let firstRoomName = hugo.residence?[0].name {
    print("The fists room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name.")
}

hugo.residence?[0] = Room(name: "Bathroom") // still nothing as residene is nil

let hugosHouse = Apartment()
hugosHouse.rooms.append(Room(name: "Living Room"))
hugosHouse.rooms.append(Room(name: "Kitchen"))

hugo.residence = hugosHouse

if let firstRoomName = hugo.residence?[0].name {
    print("The first room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name.")
}

//Accessing Subscripts of Optional type
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72

print(testScores)


//Linking Multiple Levels of chaining
if let hugosStreet = hugo.residence?.address?.street {
    print("John's street name is \(hugosStreet)")
} else {
    print("Unabale to retriev the address")
}

let hugosAddress = Address()
hugosAddress.buildingName = "The Larches"
hugosAddress.street = "Laurel Street"
hugo.residence?.address = hugosAddress

if let johnsStreet = hugo.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

if let buildingIdentifier = hugo.residence?.address?.buildingIdentifier() {
    print("Hugo's buildong identifier is \(buildingIdentifier).")
}

if let beginsWithThe = hugo.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("Hugo's building identifier begins with \"The\".")
    } else {
        print("Hugo's building identifier doesn't begin with \"The\".")
    }
}
