
// Existen 3 tipos de operadores

// =========== uniarios - un elemento ==========
// assing
let b = 10
var a = 5
a = b
let five = 5
let minusFive = -five
let plusFive = -minusFive

let minusSix = -6
let alsoMinusSix = +minusFive

var number = 5
number += 3
print(+number) // solo aplica para sumar, no para autoincrementar


if a == b {
    print("Los valores de a y b son iguales")
}

// binarios - dos elementos
1+2
5-3
2*3
10.0/2.5
9%4
"Hello " + "World"

9 == 4*2+1
// Euclides


// =============== Comparativos ==================
1 == 1
1 == 2
1 != 2
2 > 1
2 < 1
2 >= 1
2 <= 1

// Para las tuplas, se revisa cada uno de los elementos, en este caso el primer dijito hace la diferencia
(1, "Pikachu") < (2, "Pichu")
(3, "Pikachu") < (2, "Pichu")

// si en caso de que existan booleanos dentro de la tupla, esto arrojara un error
// (3, true) < (2, false) // ya que no se puede utilizar < con valores booleanos

// ================== Operador Ternario =================
// sintaxis
let contentHeight = 40
var hasImage = true

var rowHeight = 0

// estructura tipica
//if hasImage {
//    rowHeight = contentHeight + 50
//} else {
//    rowHeight = contentHeight + 10
//}

// solucion con operador ternario
rowHeight = contentHeight + ( hasImage ? 50 : 10)


// =================== Operador Nil Coalescing ==============
let defaultAge = 18
var userAge: Int?


var ageTobeUsed = userAge ?? defaultAge
// en caso de que el valor sea nil, agregara un valor por defecto

// =================== Operador Rango =========================
// operador utilizado normalmente en bucles
// Existe 3 tipos de rangos
let names = ["Ricardo", "Juan Gabriel", "Pedro"]

// Rango cerrado
for idx in 1...5 {
    print(idx)
}


// Rango semi abierto
// especifica que no se debe ejecutar hasta una cierta condicion
for idx in 1..<5 {
    print(idx)
}

// es utilizado en recorrer arrays
for i in 0..<names.count {
    print("La persona \(i + 1) se llama \(names[i])")
}


// Rango abierto
// especifica que termine cuando tenga que terminar
for name in names[1...] {
    print(name)
}

// podemos definir un tope
for name in names[...2] {
    print(name)
}

// podemos combinar un abierto con un semi abierto
for name in names[..<2] {
    print(name)
}


// tambien podemos guardar un rango dentro de una variable
let range = ...5

// ======================== Operadores logicos ====================
// combina condiciones booleanas
let allowEntry = false

// not
// Si utilizamos el operador !, significa que estamos cambiando el valor booleano a lo contrario
// es decir, si la variable era false con el operador ! ahora es true
if !allowEntry {
    print("ACCESO DENEGADO")
}

// and
// ambas condiciones se deben cumplir
let enterDoorCode = true
let passRetinaScan = false

if enterDoorCode && passRetinaScan {
    print("ACCESO CORRECTO")
} else {
    print("ACCESO DENEGADO")
}

// or
// si una de las cosas es verdadera
let hasMoney = true
let hasInvitation = false

if hasMoney || hasInvitation {
    print("una de las condiciones se cumple, asi que bien")
}

if enterDoorCode && passRetinaScan ||
    hasMoney || hasInvitation {
    print("Has entrado")
} else {
    print("ACCESO DENEGADO")
}
