import UIKit

// Funciones
//declaracion:
// se agrega -> String para declarar que esta funcion devolvera un String
func greeting (person: String) -> String {
    let greet = "Hola \(person)!"
    return greet
}

greeting(person: "Vincent")

// En este ejemplo utilizamos un parametro de entrada con nombre person de tipo String
// aqui mas ejemplos

// podemos crear funciones sin parametros
func sayHelloWorld() -> String {
    return "Hello World"
}

// una funcion puede tener mas de un parametro de entrada
func greeting(person: String, isMale: Bool) -> String {
    if isMale {
        return "Bienvenido \(person)"
    } else {
        return "Bienvenida \(person)"
    }
}


// Valores de retorno
// podemos tener funciones que no retornen valores
func greet2(person: String) {
    print("Hola \(person)")
}

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

// podemos ignorar el valor de retorno con
let _ = printAndCount(string: "Hola que pasa")

// podemos devolver mas de un valor y especificar un posible nil
func minMax(array:[Int]) -> (min: Int, max: Int)? {
    var currentMin = array[0]
    var currentMax = array[0]
    
    if array.isEmpty {
        return (0, 0)
    }
        
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

let bounds = minMax(array: [6,3,-8,3,1,9,5,15,-9])
print("Los valores se hallan entre \(bounds!.min) y \(bounds!.max)")


// etiquetas en parametros
// podemos agregar etiquetas para cambiar el nombre de los parametros
func someFunction(f1 firstParamName: Int, f2 secondParamName: Int) {
//    firstParamName variable de tipo entero
//    secondParamName variable de tipo entero
    print(firstParamName + secondParamName)
    
}

someFunction(f1: 5, f2: 2) // con esto hace las llamadas sean mas cortas
// lo importante es escoger bien el nombre de las etiquetas

// tambien podemos definir el que no aparezcan etiquetas en las funciones con _
func greeting(_ person: String, from hometown: String) -> String {
    return "Hola \(person) un placer que nos visites desde \(hometown)"
}

greeting("Felipe", from: "Chile")


// ademas podemos agregar valores por defectos dentro de una funcion
func anotherSomeFunction(n1 firstNumber: Int, n2 secondNumber: Int = 0) -> Int {
    return firstNumber + secondNumber
}

// podemos agregar que una funcion pueda ser variadica = puede venir 1 a mas argumentos
func mean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

mean(1,2,4,5,6)
mean(2,5)


// PARAMETROS INOUT
// son parametros que se modifican al finalizar la funcion, son tomados como parametros de entrada salida
var x = 5
// en la funcion los parametros son tomados como constantes y no se pueden modificar en el interior
func addOne(number: Int) {
    // una solucion seria crear una variable de paso
    var number2 = number
    number2 += 1
    print("El numero ahora vale \(number2)")
}

addOne(number: x)


// pero podemos realizarlo de otra manera
var someInt = 3
var otherInt = 7

// podemos agregar inout para especificar una variable de entrada salida
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

// en este caso pasamos la referencia de memoria
swapTwoInts(&someInt, &otherInt)

// hay que tener cuidado, ya que las variables externas quedaran reflejadas con el cambio
someInt
otherInt


// Funciones como tipo de dato
// los tipos de datos de las funciones son las sientes
func addTowInts(_ a: Int, _ b :Int) -> Int {
    return a + b
} // (Int, Int) -> Int

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
} // (Int, Int) -> Int

// cuando esta es vacia se especifica de la siguiente manera
func printHW() {
    print("Hello World")
} // () -> Void

// en este caso, podemos guardar las funciones dentro de variables
var mathFunction: (Int, Int) -> Int = addTowInts
// podemos utilizar la variable como una funcion
mathFunction(5, 4)

// asi podemos incluso declarar como parametros de entradas funciones
func printMathResult(_ mathFunc: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("resultado: \(mathFunc(a, b))")
}

// en este caso podemos agregar la funcion o la variable con la funcion
printMathResult(mathFunction, 5, 9)
printMathResult(addTowInts, 5, 9)

// tambien podemos retornar funciones
// para este caso creamos dos funciones
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

// aqui podemos decidir por cual funcion escogemos
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepBackward
}

// por ejemplo
var value = 7
let moveNearerZero = chooseStepFunction(backward: value > 0)

while value != 0 {
    print("\(value)...")
    value = moveNearerZero(value)
}
print("Cero!!")


// NESTED FUNCTIONS - Funciones anidadas
// podemos crear funciones dentro de otras funciones
func AnotherChooseStepFunction(backward: Bool) -> (Int) -> Int {
    
    func stepForward(_ input: Int) -> Int {
        return input + 1
    }

    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }
    
    return backward ? stepBackward : stepBackward
}

// por ejemplo
var value2 = 7
let AnotherMoveNearerZero = AnotherChooseStepFunction(backward: value2 > 0) // en el exterior no es visible

while value2 != 0 {
    print("\(value)...")
    value = AnotherMoveNearerZero(value2)
}
print("Cero!!")
