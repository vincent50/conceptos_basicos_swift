
import UIKit

class Counter {
    var count = 0
    
    // las funciones dentro de una clase son tomados como metodos
    func increment(){
        // llamar solo count dentro de un metodo, es mala practica.
        // Es mejor utilizar self para especificar que usamos una propiedad de una clase
        self.count += 1
    }
    
    func increment(by amount:Int) {
        self.count += amount
    }
    
    func reset(){
        self.count
    }
}

let counter = Counter()
counter.increment(by: 8)
counter.reset()


// tambien podemos especificar metodos dentro de una estructura
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRight(of x:Double) -> Bool {
        return self.x > x
    }
    
    // MUTATING METHOD
    // para un enum o struct, las variables no se pueden modificar, a menos que lo utilicemos con un metodo mutante
    mutating func moveBy(x deltaX:Double, y deltaY:Double) {
        //  self.y += deltaY
        //  self.x += deltaX
        // si utilizamos self =, le especificamos que queremos cambiar el valor de la clase
        self = Point(x: self.x + deltaX, y: self.y + deltaY)
    }
}

let somePoint = Point(x: 4, y: 5)
somePoint.isToTheRight(of: 1)
somePoint.isToTheRight(of: 54)
// Prueba de metodo mutante
// solo podemos utilizarlo con variables y no con constantes
var AnotherPoint = Point(x: 4, y: 5)
AnotherPoint.moveBy(x: 2, y: -3)


// tambien podemos mutar funciones en enumeradores
enum DifferentStateSwitch{
    case off, low, high
    mutating func next(){
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

var controllerStatus = DifferentStateSwitch.off
controllerStatus.next()
controllerStatus.next()
controllerStatus.next()


// METODOS DE CLASE
class AnotherClass{
    // depende de si que queremos heredar utilizamos static
    class func someMethod(){
        print("Hola")
    }
}

AnotherClass.someMethod()



struct LevelTracker{
    static var highesUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level:Int){
        if level > highesUnlockedLevel{
            highesUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highesUnlockedLevel
    }
    
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level){
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}


class Player{
    var tracker = LevelTracker()
    let playerName:String
    
    func complete(level: Int){
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String){
        self.playerName = name
    }
}

var player = Player(name: "Felipe Sanchez")
player.complete(level: 1)
player // el jugador sube de nivel

if player.tracker.advance(to: 7){
    print("Podemos avanzar hasta el nivel 7")
} else {
    print("El nivel 7 sigue bloqueado por ahora")
}


