struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

//Subscript Options

struct Matrix {
    let rows: Int, columns: Int
    var grid: Array<Array<Double>>
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        var row = Array(repeating: 0.0, count: columns)
        grid = Array(repeating: row, count: rows)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[row][column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[row][column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)

print(matrix.grid)

matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

print(matrix.grid)

//Type Subscripts
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
print(mars)
