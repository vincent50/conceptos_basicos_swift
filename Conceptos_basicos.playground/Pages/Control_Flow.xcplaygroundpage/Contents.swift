// Control Flow o Sentencia de control

import Foundation
import Security

// FOR IN
let names = ["Vincent", "Lulu", "Tidus"]

for name in names {
    print("Hola \(name)!")
}

let numberOfLegs = ["spider": 8, "ant": 6, "dog": 4]

for (animalName, legCount) in numberOfLegs {
    print("Animal: \(animalName), numero de patas: \(legCount)")
}

for idx in 1...5 {
    print(idx)
}

let base = 2
let power = 10
var answer = 1
for _ in 0..<power { // para no malgastar memoria podemos utilizar un for sin una variable agregando _
    answer *= base
    print(answer)
}

var hour = 9
let minute = 60
let minuteInterval = 5
for tickMark in stride(from: 0, to: minute, by: minuteInterval){ // crea intervalos
    print("\(hour): \(tickMark)")
}


// WHILE
var i = 0
while i <= 10 {
    print(i)
    i += 1
}

// repeat while es como un do-while en otros lenguajes
repeat {
    i += 1 // se ejecutara por lo menos una vez
} while i <= 10 // ya que la condicion es false

print(i)



// IF - ELSE
var temp = 18

if temp <= 15 {
    print("Hace frio! Enciende la calefaccion")
} else if temp >= 25 {
    print("Empieza a hacer calor, encendamos el aire acondicionado")
} else {
    print("La sensacion termica es agradable, no hace falta modificarla")
}



// SWITCH
let someCharacter: Character = "z"

switch someCharacter {
    case "a", "A":
        print("Es la primera letra del alfabeto")
    case "z", "Z":
        print("Es la ultima letra del alfabeto")
    default:
        print("Es alguna otra letra")
}


// interval matching
let moons = 62
let phrase = "lunas en Saturno"
let naturalCount: String

switch moons {
case 0:
    naturalCount = "No hay"
case 1..<5:
    naturalCount = "Hay unas pocas"
case 5..<12:
    naturalCount = "Hay bastantes"
case 12..<100:
    naturalCount = "Hay decenas de"
case 100..<1000:
    naturalCount = "Hay centenares de"
default:
    naturalCount = "Hay incontables"
}

print("\(naturalCount) \(phrase)")

// switch con tuplas
let somePoint = (1,1)

switch somePoint {
case (0,0):
    print("El punto \(somePoint) es el origen de coordenadas")
case (_, 0): // ignorar un elemento
    print("El punto \(somePoint) es halla sobre el eje de la x")
case (0, _):
    print("El punto \(somePoint) es halla sobre el eje de la y")
case (-2...2, -2...2):
    print("El punto \(somePoint) se halla en el interior del cuadro de lado 4")
default:
    print("El punto \(somePoint) esta en algun lado")
}

let anotherPoint = (2,2)

// guardar variables con valores de la tupla
switch anotherPoint {
case (let x, 0):
    print("Sobre el eje de las X, con el valor \(x)")
case (0, let y):
    print("Sobre el eje de las Y, con el valor \(y)")
case let (x,y) where x == y:
    print("El punto se halla sobre la recta x = y")
case let (x,y) where x == -y:
    print("El punto se halla sobre la recta x = -y")
case let (x,y):
    print("En algun otro lugar del plano, en (\(x),\(y))")
}

// Switch casos compuestos
let anotherCharacter: Character = "E"

switch anotherCharacter.lowercased() {
case "a", "e", "i", "o", "u":
    print("Se trata de una vocal")
case "b","c","d","f","g","h","j","k","l","m","n","ñ","p","q","r","s","t","v","w","x","y","z":
    print("Se trata de una consonante")
default:
    print("Se trata de otro caracter que no es vocal ni consonante")
}

let stillAnotherPoint = (9,0)

switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("Se halla sobre el eje, a distancia \(distance) del origen")
default:
    print("No esta sobre el eje")
}



// Control Transfer Sentencer

// CONTINUE - BREAK
let sentence = "las mentes grandes piensan. igual"
var filteredSentence = ""
let charactersToRemove:[Character] = ["a", "e", "i", "o", "u"]

for char in sentence {
    if charactersToRemove.contains(char) {
        continue
    }
    if char == "." {
        break
    }
    filteredSentence.append(char)
}
filteredSentence


// FALLTHROUGH - para hacia adelante
// se utiliza en switch y sirve para poder validar mas condiciones
let integerToDescribe = 5
var description = "El numero \(integerToDescribe) es"

switch integerToDescribe {
case 2,3,5,7,11,13,17,19:
    description += " un numero primo y"
    fallthrough
default:
    description += " un numero entero"
}
description


// RETURN - GUARD
// generando un dato unwrapping
var people = ["name": "Vincet", "age": 32, "isMale": true] as [String:Any]
let surname = people["surname"]

// como atacariamos
if let surname = people["surname"] {
    print(surname)
}

// una mejor forma
// se puede tomar que es la forma contraria que la anterior, ya que ejecuta en caso de ser nil
// si alguien puede crearlo, sino
func test(person:[String: Any]){
    guard let surname = people["surname"] else {
        return // regresa fuera de la funcion
    }
    // aqui existe surname
    print(surname)
}

test(person: people)


// AVAILABLE - valida versiones de IOS
if #available(iOS 12, macOS 10.12, *) {
    // ejecutar las acciones a lo iOS12+, a los macOS10+
} else {
    // Mantener el codigo viejo con versiones anteriores de iOS, macOS
}



