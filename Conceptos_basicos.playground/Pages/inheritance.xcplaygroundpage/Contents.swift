import UIKit

class Vehicle{
    final var type = "Vehicle" // las variables de tipo final, no se pueden sobreescribir
    var currentSpeed = 0.0
    var description: String{
        return "Viajando a \(currentSpeed) km/h"
    }
    func makeNoise(){
        //do nothing, porque cada vehiculo hace un ruido diferente
    }
}

let someVehicle = Vehicle()
print(someVehicle.description)

// de esta manera podemos agregar una clase padre para heredar todas sus caracteristicas
class Bicycle: Vehicle {
    var hasBasket = false
    
    // si sobreescribimos aqui y luego heredamos, los hijos de esta clase obtendran esta modificacion
    override func makeNoise() {
        print("Clin Clin")
    }
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0

print(bicycle.description)

// podemos herederar de una clase heredada
class Tandem: Bicycle {
    var currentNumberOfPassenger = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassenger = 2
tandem.currentSpeed = 22.0
print(tandem.description)
tandem.makeNoise()

class Train: Vehicle{
    var countOfVagons = 0
    
    override func makeNoise() {
        print("Chooo chooo!")
    }
}

var train = Train()
train.countOfVagons = 10
train.makeNoise()


class Car: Vehicle{
    var gear = 1
    override var description: String{
        return super.description + " en la marcha \(gear)"
    }
}

let car = Car()
car.currentSpeed = 55
car.gear = 3
car.description



class AutomaticCar: Car {
    override var currentSpeed: Double{
        didSet{
            gear = Int(currentSpeed / 15.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 65
automatic.description

