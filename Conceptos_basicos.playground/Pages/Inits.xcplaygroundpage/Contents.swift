import UIKit

struct Fahrenheit {
    var temperature: Double
    
    init() {
        self.temperature = 32
    }
}

var f1 = Fahrenheit()

struct Celsius {
    var temperature: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        self.temperature = (fahrenheit - 32) / 1.8
    }
    
    init(fromKelvin kelvin:Double) {
        self.temperature = kelvin - 273.15
    }
    
    init(_ celsius:Double){
        self.temperature = celsius
    }
}


let boilingPointOfWater = Celsius(fromFahrenheit: 212)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)


// Modificar constructores - Nombre, etiquetas y optionals

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white:Double) {
        self.red = white
        self.green = white
        self.blue = white
    }
}

let magenta = Color(red: 1, green: 0, blue: 1)
let halfGrey = Color(white: 0.5)


// parametro opcional
class SurveyQuestion {
    let text: String
    var response: String? // no es necesario agregar en el init
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(ask)
    }
}

let q1 = SurveyQuestion(text: "Te gustan los videojuegos?")
q1.ask()
q1.response = "Si me gustan"


// Inicializadores en subclases
// Designado -> designado super clase

// Conveniencia -> Otro init de la misma clase

// El ultimo init que se llame siempre debe ser designado

class Vehicle{
    var numberOfWheels = 0
    var description: String{
        return "\(numberOfWheels) ruedas"
    }
}

let vehicle = Vehicle()
vehicle.description

class Bicycle: Vehicle {
    override init() {
        super.init()
        self.numberOfWheels = 2
    }
}

let bicycle = Bicycle()
bicycle.description


// por conveniencia
class Hoverboard: Vehicle{
    var color: String
    init(color: String) {
        self.color = color
    }
    override var description: String{
        return "\(super.description) en el color \(super.numberOfWheels)"
    }
}

let hoverboard = Hoverboard(color: "Silver")
hoverboard.description


// FAILABLE INITIALIZER
// en caso de que la inicializacion no es posible
enum TemperatureUnit{
    case kelvin, celsius, fahrenheit
    
    init?(symbol: Character){
        switch symbol.lowercased(){
        case "k":
            self = .kelvin
        case "c":
            self = .celsius
        case "f":
            self = .fahrenheit
        default:
            return nil // se debe especificar que el init puede ser nil con ?
        }
    }
}


let someUnit = TemperatureUnit(symbol: "x")


class Product{
    let name: String
    init?(name: String){
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class CartItem: Product{
    let quantity: Int
    init?(name: String, quantity: Int){
        if quantity < 1 {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let someSocks = CartItem(name: "Socks", quantity: 2){
    print("\(someSocks.name) - \(someSocks.quantity)")
}


// DESTRUCCION DE OBJECTOS CON deinit
class Bank{
    static var coinsInBank = 2_000
    static func distribute(coins numberOfCoinsRequested:Int) -> Int{
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func recive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int){
        self.coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    deinit { // se ejecuta cuando se elimina esta instancia
        Bank.recive(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
Bank.coinsInBank
playerOne!.win(coins: 2_000)

playerOne = nil
Bank.coinsInBank
