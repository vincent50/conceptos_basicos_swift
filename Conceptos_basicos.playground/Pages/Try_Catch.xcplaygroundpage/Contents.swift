import UIKit

// Para indicar un posible error dentro de una funcion, se debe declarar con la palabra throws

func canThrowError() throws {
    // aqui hay un codigo que puede causar un error
}

do {
    try canThrowError()
    // Si llegamos aqui, no ha habido error
} catch {
    // Si llegamos aqui, ha habido un error
}

// Aserciones y Precondiciones

// La función assert() te permite verificar el estado de tu programa en tiempo de ejecución y fallar si las cosas no son como deberían ser. Una de las características interesantes de assert() es que se elimina automáticamente cuando construyes tu aplicación en modo de lanzamiento, pero si no queres que eso suceda, si queres que tu aplicación se bloquee si algo está muy mal, entonces deberías usar la función precondition() en su lugar.

// Assert : {debug} y Precondition: {build}

let age = -5
//... aqui el codigo sigue

assert(condition: age >= 0, "La edad de una persona no puede ser negativa")
// si no cumple la condicion emite un error

if age >= 10 {
    print("Puedes pasar")
} else if age >= 0 {
    print("No puedes pasar")
} else {
    assertionFailure("La edad no puede ser negativa") // Error inminente
}

let age2 = -5
//... aqui el codigo sigue

precondition(condition: age2 >= 0, "La edad de una persona no puede ser negativa")
// si no cumple la condicion emite un error

if age2 >= 10 {
    print("Puedes pasar")
} else if age2 >= 0 {
    print("No puedes pasar")
} else {
    preconditionFailure("La edad no puede ser negativa") // Error inminente
}
