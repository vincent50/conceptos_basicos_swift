// Arrays
// declarar un array vacio
var someInts = [Int]()
someInts = [] // forma rapida de vaciar los arrays

var someDouble = Array(repeating: 3.141592, count: 7)
var moreDoubles = Array(repeating: 2.5, count: 4)
var aLotOfDoubles = someDouble + moreDoubles // suma ambos arrays

var shoppingList: [String] = ["Papas", "Pimientos", "Tortillas", "Basura", "Something"]

// contar cantidad de elementos
shoppingList.count

// Agregar un elemento
someInts.append(31)
shoppingList += ["Bebida", "Empanadas"]

// quitar elementos
let pepper = shoppingList.remove(at: 1) // lo elimina y lo guarda en una variable
let lastRemoved = shoppingList.removeLast()
let firstRemoved = shoppingList.removeFirst()

// consultar si esta vacio
if shoppingList.isEmpty {
    print("La lista esta vacia")
}

// obtener el primer elemento
var fistElement = shoppingList[0]

// guardar un nuevo dato en index
shoppingList[0] = "Huevos"
shoppingList[1...3] = ["Frutillas"]

// indices
shoppingList[1]
shoppingList[0...1]


// Iterando arrays
for item in shoppingList {
    print(item)
}

// iterando con index
for (idx, item) in shoppingList.enumerated(){
    print("item \(idx + 1): \(item)")
}



// Conjuntos (Set)
// es la forma mas basica de organisar objetos sin un orden particular

// declarar conjuntos
var letters = Set<Character>()
var favoritGames: Set<String> = ["Final Fantasy", "World of Warcraft", "Pokemon"]

// obtener cantidad
letters.count

// agregar mas elementos
letters.insert("a") // inserta pero no tiene un indice para ordenar
letters.insert("h")

// consultar si esta vacio
if favoritGames.isEmpty {
    print("No hay juegos favoritos")
}

// eliminar elementos
if let removedGame = favoritGames.remove("Pokemon") {
    print("He eliminado de la lista \(removedGame)")
}

// validar existencia
if favoritGames.contains("World of Warcraft") {
    print("Me encanta ese juego")
}

// iterar elementos
for vg in favoritGames {
    print(vg)
}

// Podemos ordenar los elementos
favoritGames.sorted()

// Matematica discreta (EGB)
let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let primeNumbers: Set = [2,3,5,7]

// A union B = elementos que son bien de A, o bien de B o de los dos
oddDigits.union(evenDigits).sorted()

// A interseccion B = elementos que son a la vez de A y de B
oddDigits.intersection(evenDigits)
evenDigits.intersection(primeNumbers).sorted()
oddDigits.intersection(primeNumbers).sorted()

// A - B = elementos que son de A pero no de B
oddDigits.subtracting(primeNumbers).sorted()

// A +m B = Diferencia simetrica = (A-B) union (B-A)
oddDigits.symmetricDifference(primeNumbers).sorted()


// Revisar subconjuntos
let houseAnimals: Set = ["🐕", "🐈"]
let farmAnimals: Set = ["🐄", "🐓", "🐕", "🐈", "🐑"]
let cityAnimals: Set = ["🐀", "🕊"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)

// A y B son disjuntos si su interseccion es vacia
farmAnimals.isDisjoint(with: cityAnimals)



// Diccionarios
// en el diccionario no tenemos posiciones, sino que por claves (key)
// el diccionario no posee orden

// crear diccionarios
var namesOfIntegers = [Int: String]()
var airports: [String: String] = ["YYZ": "Toronto",
                                  "DUB": "Dublin",
                                  "PMI": "Palma de Mallorca"]


// insertar elementos a un diccionario
namesOfIntegers[15] = "quince" // esto especifica la key y no a la posicion
airports["LHR"] = "London City Airport"

// vaciar diccionarios
namesOfIntegers = [:]

// validar si es vacio
if airports.isEmpty {
    print("El diccionario esta vacio")
}

// actualizar valores
if let oldValue = airports.updateValue("Dublin Airports", forKey: "DUB") {
    print("El aeropuerto tenia antiguamente el nombre de \(oldValue)")
}

if let airportName = airports["DUB"] {
    print("El aeropuerto de DUB es: \(airportName)")
}

// eliminar elementos de un diccionario
airports["PMI"] = nil
airports.removeValue(forKey: "DUB") // devuelve el elemento eliminado (utilizar con un if let)

// Iterando diccionarios
for (key, value) in airports {
    print("\(key) - \(value)")
}

for airportKey in airports.keys {
    print(airportKey)
}

for airportName in airports.values {
    print(airportName)
}

// para obtener las claves en una variable
let aiportKeys = [String](airports.keys)
// paraobtener los valores de un diccionario
let aiportNames = [String](airports.values)

