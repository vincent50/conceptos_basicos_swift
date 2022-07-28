// Un enumerador es como una clase vaga
// podemos agregar una lista que no pueda a cambiar
// este tiene varios tipos de casos

enum SomeEnumeration {
    // Aqui iria la definicion del enumerador
}


enum CompassPoint {
    case north
    case south
    case east
    case west
}


enum Planet{
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}


// para utilizarlas con variables
var directionToGo = CompassPoint.east
directionToGo = .north // swift ya sabe que es un enumerado y se puede cambiar de este modo


// Podemos utilizarlo con un switch
switch directionToGo {
case .north:
    print("Hay que ir al norte")
case .south:
    print("Hay pinguinos en el sur")
case .east:
    print("Mordor se extiende hacia las tierras del este")
case .west:
    print("Cuidado con los vaqueros")
}


// bucles en enumeradores
// le delegamos un tipo iterable
enum Beverage: CaseIterable {
    case coffe, tea, juice, redbull
}

let numberOfChoice = Beverage.allCases.count

for beverage in Beverage.allCases {
    print(beverage)
}



// Codigo de barra
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = Barcode.qrCode("ASDASFSDF")


switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode): // podemos quitar el let
    print("QR: \(productCode)")
}


// Enumeradores con raw values
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}


// swift crea la numeracion automatica
enum Planet2: Int{
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earthOrder = Planet2.earth.rawValue // solo se puede consultar si se especifica

let possiblePlanet = Planet2(rawValue: 5) // nos da el valor del planeta
//let possiblePlanet = Planet2(rawValue: 25) // si no existe este da un nil
