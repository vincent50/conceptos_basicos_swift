import UIKit
import Foundation

// En SWIFT en caso de no ingresar un valor inicial nos arroja un error de TypeAnnotation
// var welcomeMessage

// Podemos declarar un tipo de anotacion de la siguiente manera
var welcomeMessage : String

// Con esto podemos agregar valores de tipo String siempre que queramos
welcomeMessage = "Hola"

// Podemos declarar un tipo en muchas variables
var red, green, blue : Double

// https://bit.ly/2SOIyRW

// =============== TIPOS DE DATOS ==================

// INTEGER - NUMBERS
// Siempre es bueno optimizar la memoria con este tipo de variable
let age = 31 // Con esto no podemos definir exactamente el espacio de memoria, en la mayoria de los sistemas Apple obtiene este valor como un UInt64

let age_8 : UInt8 = 31

// el numero mas pequeño de 8 bit sin signo que hay
let minValue8 = UInt8.min // 2^0-1
let maxValue8 = UInt8.max // 2^8-1
// Algo util para poder utilizar 255 numeros son
// los colores

// Los mas normales son el de 32 y 64 (como en los OS)
// Mas que nada menciona que tipo de entero puede leer
let minValue32 = UInt32.min // 2^0-1
let maxValue32 = UInt32.max // 2^32-1

let minValue64 = UInt64.min // 2^0-1
let maxValue64 = UInt64.max // 2^64-1

// FLOAT (32bit) - DOUBLE (64bit)

// Float sirve para especificar el tipo de dato en forma decimal pero al llegar a un cierto punto redondea las cifras.

// Double define tambien las variables o constantes en forma decimal pero sin redondear las cifras y otorga mayor precisión

let f1 = 3.1415 // Esto lo genera como double automaticamente

// Podemos mejorar la memoria especificando el tipo de dato Float
let π: Float = 3.14159265 // El problema es que no es preciso como un Double, ya que podemos utilizarlo hasta una cierta cifra

let π_d: Double = 3.14159265 // Con esto lo podemos especificar con mas detalle

// Podemos redondear nuestros valores con la libreria Foundation, utilizando su funcion round()
let round_age = round(31.7)


// NUMEROS LITERALES

// Si nosotros utilizamos decimales o Integer
let decimalInteger = 17

// Tambien podemos especificar estos numeros de diferentes formas
// binario
let binaryInteger = 0b10001 // 1*2^4+0*2^3+0*2^2+0*1^1+1*2^0

// octal
let octalInteger = 0o21 // 2*8^1+1*8^0

// hexadecimal
let hexadecimalInteger = 0x11 // 1*16^1+1*16^0


let decimaDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

// Tecnicas para no confundir largo de montos
let paddedDouble = 000123.456
let someNumber = 00000097.540

let oneMillion = 1_000_000
let justMoreThanAMillion = 1_000_000.000_000_1

let cannotBeNegative: UInt8 // No puede ser negativo

// =============== CONVERTIR ENTRE TIPOS ============

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1

// Al intentar sumar estos dos arroja un error entre dos clases
// Para solucionar esto, se utiliza Casting
let twoThousandAndOne = twoThousand + UInt16(one)
// Nota que este error solo lo arroja cuando se utiliza variables

// Downcasting
// Truncar = Cortar todo lo que esta despues de un punto
let pi = 3.14159265
let pi_integer = Int(pi)

// ============= TYPE ALIAS ====================

// Nos permite cambiar el nombre de nuestros tipos de datos
// para hacerlo mas legible para humanos

typealias AudioSample = UInt16
let currentAudioSample: AudioSample

// BOOLEAN
// solo pueden ser true o false
let orangesAreOranges = true
let foodIsDelicious = false

var isAged: Bool

// TUPLAS

// Esto es similar a un Diccionario en otros lenguajes
// La tupla es un tipo de vector
let http404Error = (404, "Página no encontrada")
let (statusCode, statusMessage) = http404Error // destructuracion. Podemos separar la informacion de una tupla en variables

print("El código del estado es \(statusCode)")
print("El mensaje del servidor es \(statusMessage)")
print("El código es \(http404Error.0)")
print("El mensaje es \(http404Error.1)")

let (justStatusCode, _) = http404Error // Podemos ignorar datos con _ desntro de la destructuracion

// En este tipo de lenguajes de programación siempre es buena idea no dejar sin declarar el tipo de variables que tendrá la Tupla (Tuple en inglés). La forma de hacerlo es de la siguiente forma:


let httpError: (Int, String) = (404, "Page not found") // Si quieren crearlo como un tipo de Array
let httpErrorObject: (errorType: Int, message: String) = (errorType: 404, message: "Page not found") // Si lo quieres crear como diccionario

print("El código es \(httpErrorObject.errorType)")
