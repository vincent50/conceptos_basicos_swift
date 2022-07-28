import UIKit

class OnePerson{
    var residence: OneResidence? // No es obligado a construir inicializados
}

class OneResidence {
    var numberOfRooms = 1
}


let edgar = OnePerson()

// let roomCount = edgar.residence!.numberOfRooms // esto da error por que aun no tiene residence


// Optional Chaning
if let roomCount = edgar.residence?.numberOfRooms {
    print("La casa de Edgar tiene \(roomCount)")
} else {
    print("Edgar no tiene casa")
}

edgar.residence = OneResidence()
if let roomCount = edgar.residence?.numberOfRooms {
    print("La casa de Edgar tiene \(roomCount)")
} else {
    print("Edgar no tiene casa")
}


// Ejemplo Optional Chaning
// en cadena
class Person{
    var residence: Residence?
}

class Residence{
    var rooms = [Room]()
    var numberOfRooms: Int{
        return rooms.count
    }
    subscript(i: Int) -> Room{
        get{
            return rooms[i]
        }
        set{
            rooms[i] = newValue
        }
    }
    var address: Address?
    
    func printNumberOfRooms(){
        print("El numbero de habitaciones es \(numberOfRooms)")
    }
}

class Room{
    let name: String
    init(name: String){
        self.name = name
    }
}

class Address{
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String?{
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber), \(street)"
        }else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}


let me = Person()
if let roomCount = edgar.residence?.numberOfRooms {
    print("La casa de Edgar tiene \(roomCount)")
} else {
    print("Edgar no tiene casa")
}

func createAddress() -> Address {
    print("La funcion ha sido llamada")
    let someAddress = Address()
    someAddress.buildingNumber = "13"
    someAddress.street = "Calle false"
    return someAddress
}

me.residence?.address = createAddress() // este trozo no se ejecuta porque residence es nil
me

me.residence?.printNumberOfRooms() // no se ejecuta, ya que residence es nil

if me.residence?.printNumberOfRooms() != nil{
    print("He podido obtener el numero de habitaciones")
} else {
    print("NO ha sido posible saber el numero de habitaciones")
}

if (me.residence?.address = createAddress()) != nil {
    print("Ha sido posible configurar la direccion de Me")
} else {
    print("Seguimos sin saber donde vive Me")
}

if let firstRoomName = me.residence?[0].name {
    print("La primera habitacion es de \(firstRoomName)")
} else {
    print("La primera habitacion no sabemos de quien es")
}

me.residence?[0] = Room(name: "Bathroom") // el resultado es nil, porque residence nunca ha sido asignado

let meHouse = Residence()
meHouse.rooms.append(Room(name: "Bathroom"))
meHouse.rooms.append(Room(name: "Bedroom"))
meHouse.rooms.append(Room(name: "Kitchen"))

me.residence = meHouse

if let firstRoomName = me.residence?[0].name {
    print("La primera habitacion es de \(firstRoomName)")
} else {
    print("La primera habitacion no sabemos de quien es")
}


// Optional Chaining Multiple
if let meStreet = me.residence?.address?.street {
    print("La casa de Me esta en la calle \(meStreet)")
} else {
    print("No se donde esta la casa de Me")
}

// Tiene Residence, pero no tiene direccion, entonces su valor es nil

me.residence?.address? = createAddress()
if let meStreet = me.residence?.address?.street {
    print("La casa de Me esta en la calle \(meStreet)")
} else {
    print("No se donde esta la casa de Me")
}

if let buildingIdentifier = me.residence?.address?.buildingIdentifier() {
    print("Me vive en \(buildingIdentifier)")
}


if let _ = me.residence?.address?.buildingIdentifier()?.hasPrefix("13") {
    print("Me vive en el numero 13")
} else {
    print("No vive en el numero 13")
}
