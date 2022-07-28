import UIKit
// Tipos de funcioes:
// 1. Global Function
let names = ["Felipe", "Belen", "Zireael"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

backward("Vincent", "Edgar")
var reversedNames = names.sorted(by: backward)

// 2. Nested Function


// 3. Closure
// se crearon para tener una sintaxis mas limpia y sencilla

/*
 { (params) -> return type in
    // Código del closure
 }
 */
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// version reducida
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
reversedNames = names.sorted(by: { $0 > $1 })
reversedNames = names.sorted(by: >)

// TRALLING CLOSURE - llamando a un closure
func someFunctionThatTakesClosure(closure: () -> Void) {
    
}

someFunctionThatTakesClosure(closure: {
    // Aqui iria el cuerpo del closure
})

someFunctionThatTakesClosure {
    // Añadir el closure aqui
}

// en este trailing closure necesitamos especificar los elementos, es lo mas pequeño que podemos reducir
reversedNames = names.sorted { $0 > $1 }

let digitNames = [0:"Cero", 1: "Uno", 2:"Dos", 3:"Tres", 4:"Cuatro", 5:"Cinco", 6:"Seis",
                  7:"Siete", 8:"Ocho", 9:"Nueve"]

let numbers = [16, 58, 510, 2127]

let numberString = numbers.map { (number) -> String in
    var number = number // recombertir de constante a variable
    var output = ""
    repeat {
        output = digitNames[number%10]! + output
        number /= 10
    } while number > 0
    return output
}


// Capturar Valores en un closure
// es como si tomamos variables globales dentro de un closure
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runingTotal = 0 // esta variable dura en el tiempo dentro de una instancia
    func incrementer() -> Int {
        runingTotal += amount
        return runingTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()


// ESCAPING CLOSURE
// es un closure que sobrevive a la funcion a la que se le paso
// modificadores @
var completionHandlers: [() -> Void] = []

// el parametro no se utiliza en el codigo, sino que se guarda para mas adelante
func someFuncionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

completionHandlers.count

// Este no es llamado
func someFunctionWithNonEscapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        // este queda guardado para utilizar en el futuro
        someFuncionWithEscapingClosure {
            self.x = 100
        }
        // este se ejecuta en el momento que se llama
       someFunctionWithNonEscapingClosure {
            x = 200
        }
    }
}

let instance = SomeClass()
print(instance.x)

instance.doSomething()
print(instance.x)


completionHandlers.count
completionHandlers.first?() // en este caso se guarda este metodo en nuestro array y podemos llamarlo desde aqui
print(instance.x) // ahora x tiene el valor de el closure

