import UIKit

// Optional
// Es un valor que puede o no puede estar en una variable

// nil != null
// nil = ausencia de valor
// null = apuntador a objeto vacio

let possibleAge = "31"
let convertedAge = Int(possibleAge) // Esto es un Int?

let possibleAge2 = "Vincent"
let convertedAge2 = Int(possibleAge2) // Esto es un Int?, en este caso es un nil

// Para poder ingresar valores nil, debemos declararla en un inicio con el simbolo ?
var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String? // si no se le asigna valor, agregaria automaticamente el valor nil


// Force Unwrapping

// Podemos forzar a una variable opcional a convertirse al tipo de dato definido

if convertedAge != nil {
    print("La edad del usuario es nula: \(convertedAge!)")
} else {
    print("La edad del usuario no es nulo")
}

// Optional Binding

// Es una estructura para poder trabajar los tipo de datos optionals

if let actualAnswer = surveyAnswer {
    // Al llegar aqui el valor no es nil
} else {
    // Al llegar aqui el valor es nil
}

// Se pueden agregar multiples condiciones
if let firstNumber = Int("4"),
   let secondNumber = Int("3"),
   firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}



// Unwrap implicito

let possibleString: String? = "Un string opcional" // String opcional
let forcedString: String = possibleString! // Convercion forzada

// Este seria la solucion en caso de conocer el tipo de dato
let assumedString: String! // Esto tiene que ser un String o no funcionara
