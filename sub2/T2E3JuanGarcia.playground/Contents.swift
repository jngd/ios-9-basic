//: Playground - noun: a place where people can play

import UIKit

var array = ["uno","dos","tres","cuatro"]
for elemento in array {
    print(elemento)
}


// Ejercicio 3 Ampliacion 1

func sumaEnteros(enteros : NSArray) -> Int {
    
    
    
    var result: Int = 0
    
    for i in enteros{
        
        result += i.integerValue
        
    }
    
    return result
    
}

print("La suma de los enteros es \(sumaEnteros([2,2,2,2,2,2,2,2,2,2]))")



// Ejercicio 3 Ampliacion 2

func addInts()->NSMutableArray{
    var array: NSMutableArray = [];
      
    for i in 0...9{
        array.addObject(1);
    }
    
    return array
}

print("\(sumaEnteros(addInts()))")
