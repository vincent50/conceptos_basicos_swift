import UIKit

// Stored Properties
struct FixedLengthRange {
    var firstValue: Int // stored properties
    let length: Int // stored properties
}


var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6



// Lazy Stored Properties
// las propiedades lazy no se inicializan al crear un objeto
class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter() // no se crea al crear un manager, sino que solo cuando es necesario
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Algo de datos")
manager
// en esta linea el importer aun no ha sido creado
manager.importer.filename // cuando se escribe aqui, es cuando realmente guarda memoria para utilizar este dato
manager


// Computed properties
// Realiza calculos por las propiedades de un objeto
struct Point{
    var x = 0.0, y = 0.0
}

struct Size{
    var width = 0.0, height = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    var center: Point{ // computed properties
        get{ // permite generar este computed al generar una instancia
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY) // debe devolver el mismo tipo solicitado
        }
        set(newCenter){ // permite modificar esta misma propiedad realizando otra operacion
            origin.x = newCenter.x - size.width / 2
            origin.y = newCenter.y - size.height / 2
        }
        // optimizado
//        get{ // podemos retornar un Pointer con todo el calculo
//            return Point(centerX = origin.x + size.width / 2, centerY = origin.y + size.height / 2)
//        }
//        set{ // newValue, es el valor por defecto
//            origin.x = newValue.x - size.width / 2
//            origin.y = newValue.y - size.height / 2
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))
square.center

let initialSquareCenter = square.center
square.center = Point(x: 20, y: 20)


// Computed properties de solo lectura
struct Cuboid{
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double{
        // si no se especifica get o set, esto se toma de solo lectura (get)
        return width * height * depth
    }
}

let cuboid = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
cuboid.volume
// cuboid.volume = 27.0 Error porque no se puede modificar


// PROPERTY OBSERVER
// Hay 2 tipos de observer
// willSet = se llama justo antes de cambiar una property
// didSet = se llama despues de modificar una property

class StepCounter{
    var totalSteps: Int = 0 {
        willSet(newTotalSteps){ // newValue es el valor por defecto
            print("El numero de pasos va a subir hasta el \(newTotalSteps)")
        }
        didSet{ // oldValue es el valor por defecto
            if totalSteps > oldValue {
                print("El numero de pasos ha incrementado en \(totalSteps - oldValue)")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 520


// TYPE PROPERTY
struct SomeStruct {
    static var storedTypeProperty = "SOME VALUE" // se comparte para todas las instancias de una clase
    static var computedTypeProperty: Int{
        return 1
    }
}

// ambas de estas estructuras no tienen acceso a la instancia
var instanceSrt = SomeStruct()
var oherInstanceStr = SomeStruct()

// pero si se puede acceder de la propia estructura
SomeStruct.storedTypeProperty

enum SomeEnum {
    static var storedTypeProperty = "SOME VALUE" // se comparte para todas las instancias de una clase
    static var computedTypeProperty: Int{
        return 1
    }
}

SomeEnum.storedTypeProperty

// para este caso se deben de sobrescribir, se vera mas adelante
class SomeClass {
    static var storedTypeProperty = "SOME VALUE" // se comparte para todas las instancias de una clase
    static var computedTypeProperty: Int{
        return 1
    }
}

