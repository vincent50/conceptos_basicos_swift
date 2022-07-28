// creacion de String

// el string literal es de una sola linea
let someString = "Soy un string literal"

// Podemos generar texto multilinea
let multiLineString = """
A partir de aqui se utiliza
un string de multilinea
Si agregamos el simbolo->\
significa que no realizara un salto de linea
 El espacio al inicio es tomado por Swift
"""

// Lo que hace realmente el simbolo \, es eliminar el siguiente simbolo dentro del texto
// En el ejemplo anterior lo que sucede, es que se elimina el salto de linea
print(multiLineString)

let wiseWord = "\"La imaginación es más importante que el saber\" - Albert Einstein"
// Para este caso utilizamos \ para poder utilizar el simbolo "

// Tambien se pueden utilizar caracteres unicode para generar caracteres o emojis
let dolarSign = "\u{24}"
let blackHeart = "\u{2665}"
let heart = "\u{1F496}"

// Inicializacion y mutabilidad

// iniciar un String vacio
var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nada que ver aquí")
} else {
    print("El String tiene un valor")
}

// mutable
var newSomeString = "Un caballo"
newSomeString += " y un carruaje"

// tipo de dato evaluado son todos los datos que se pueden copiar y son independientes
// tipo de dato por referencia

var a = "A"
var b = "B"
b = a
print("a vale \(a) y la b vale \(b) ")

// Characters
let name = "Vincent"
for character in name {
    print(character)
}
print(name.count)

let exclamationMark: Character = "!"

let nameChars: [Character] = ["V", "i", "n"]
let nameString = String(nameChars)

let compoundName = "Vincent " + "Gabriel"
newSomeString = nameString + String(exclamationMark) // Se puede hacer asi
newSomeString.append(exclamationMark) // pero una solucion mas comoda seria esta

// Indices de Strings
let greeting = "Hola, que tal?"
greeting[greeting.startIndex]
//greeting[greeting.endIndex]

greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]

for idx in greeting.indices {
    print("\(greeting[idx])", terminator: " ")
}

var welcome = "Hola"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " que tal", at: welcome.index(before: welcome.endIndex))
welcome.remove(at: welcome.index(before: welcome.endIndex))
welcome

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)

// Substring
// para detectar la , de greeting
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let firstPart = greeting[..<index]

let newString = String(firstPart)


// Prefijos y Sufijos
// poder saber si contiene o empieza o termina con alguna palabra
let newGreeting = "Hola, soy Vincent"
newGreeting.hasPrefix("Hola") // si inicia por
newGreeting.hasSuffix("ent") // si finaliza por

// detectar patrones en String
let collection = [
    "Act 1 Scene 1",
    "Act 1 Scene 2",
    "Act 1 Scene 3",
    "Act 2 Scene 1",
    "Act 3 Scene 1",
    "Act 1 Scene 1",
]

var act1SceneCount = 0
for scene in collection {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}

print("El numero de escenas del acto 1 es: \(act1SceneCount)")

// Unicode
let ghost = "Fantasma!! 👻"

for codeUnit in ghost.utf8 {
    print(codeUnit, terminator: " ")
}

print("")
for codeUnit in ghost.utf16 {
    print(codeUnit, terminator: " ")
}

print("")
for codeUnit in ghost.unicodeScalars {
    print(codeUnit, terminator: " ")
}
