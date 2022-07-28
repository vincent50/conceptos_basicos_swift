import UIKit
// SUBINDICES
// se pueden agregar subindices dentro de una clase

struct TimesTable{
    let multiplier: Int
    
    // es una especie de computed property
    // esto nos permite utilizarlo como si fuese un metodo con corchetes
    subscript(index: Int) -> Int{
        return multiplier * index
    }
}

let threeTimesTables = TimesTable(multiplier: 3)
print("6x3 = \(threeTimesTables[6])")

for idx in 0...10{
    print("\(idx) x 3 = \(threeTimesTables[idx])")
}


// se pueden utilizar en enumerados
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    
    static subscript(n: Int) -> Planet{
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
mars


// Matrices con subindices
struct Matrix {
    let rows: Int, columns: Int
    var grid = [Double]
    
    init(rows: Int, columns: Int){
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column:Int) -> Bool {
        return row>=0 && column >= 0 && row < rows && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row*columns)+column]
        }
        set{
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row*columns)+column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 2.5
matrix
