//Freestanding Macros
func myFunction() {
    print("Currently running \(#function)")
    #warning("Something's wrong")
}


//Attached Macros

struct SundaeToppings: OptionSet {
    let rawValue: Int
    static let nuts = SundaeToppings(rawValue: 1 << 0)
    static let cherry = SundaeToppings(rawValue: 1 << 1)
    static let fudge = SundaeToppings(rawValue: 1 << 2)
}

//can be rewrite to

@OptionSet<Int>
struct SundaeToppingsAletrnative {
    private enum Options: Int {
        case nuts
        case cherry
        case fudge
    }
}

//Macro Declaration
@attached(member)
@attached(extension, conformances: OptionSet)
public macro OptionSet<RawType>() = #externalMacro(module: "SwiftMacros", type: "OptionSetMacro")




let toppings = SundaeToppingsAletrnative(rawValue: 3)
print(SundaeToppingsAletrnative.nuts)


