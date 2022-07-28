import UIKit

// Strunct vs Class
// tienen muchas cosas en comun


// una estructura al ser inicializada, genera un espacio de memoria y en caso de ser let no podra cambiar
struct SomeStruct {
    // La definicion de la estructura aqui
}

// si una clase la iniciamos como let y las propiedades en var, las podemos cambiar sin problema
// ya que este toma un rango de espacio de memoria
class SomeClass {
    // La definicion de la clase aqui
}


// describe la informacion de algo especifico
// pueden ser variable o constantes
struct Resolution {
    var width = 0
    var height = 0
}


// describe el modo en que reproduce el video
class VideoMode {
    var resolution = Resolution() // crea una instancia de la estructura
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}


// crear instancias de un objeto
let someResolution = Resolution()
let someVideoMode = VideoMode()

print(someResolution.width)

// cambiar valores
someVideoMode.resolution.width = 1280
print(someVideoMode.resolution.width)

// no podemos cambiar el valor de una estructura let
//someResolution.width = 1280


// datos copiados por valor
// struct = copias, tienen su propio espacio de memoria
// class = referencia, apuntan a un espacio de memoria
let vga = Resolution(width: 640, height: 480)
vga.width

var cinema = vga
cinema.width = 2048
cinema.width
vga.width

// las clases no copian sus valores, son referenciados
// utilizando video Mode
let tenEighty = VideoMode()
tenEighty.resolution = vga
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

// ambos valores tienen el mismo valor porque cambiamos el valor de la referencia
alsoTenEighty.frameRate
tenEighty.frameRate

// para comparar objetos utilizamos === o para diferencia !==
if tenEighty === alsoTenEighty {
    print("Son el mismo objeto")
}
