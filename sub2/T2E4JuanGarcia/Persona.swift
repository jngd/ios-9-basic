//
//  Persona.swift
//  T2E4JuanGarcia
//
//  Created by jgd on 22/06/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

class Persona: NSObject {
    
    var edad: Int
    var altura: Double
    var nombre: NSString
    var apellido: NSString
    var aptitudes: NSMutableArray
    var contacto: Contacto
    
    init(edad:Int, altura:Double, nombre:NSString, apellido:NSString, aptitudes:NSMutableArray, contacto:Contacto){
        self.edad = edad
        self.altura = altura
        self.nombre = nombre
        self.apellido = apellido
        self.aptitudes = aptitudes
        self.contacto = contacto
    }
    
    func addCualidad(cualidad:NSString){
        aptitudes.addObject(cualidad)
    }
    
    func delCualidad(cualidad:NSString){
        aptitudes.removeObject(cualidad)
    }
    
    func aptitudesToString() -> NSString{
        return aptitudes.componentsJoinedByString(",")
    }
    
    override var description: String {
        
        return "Soy \(nombre), mido \(altura) y tengo \(edad) año/s. Estas son mis aptitudes: " +
             "\(aptitudesToString()). \nDatos de contacto: \n" +
             "\(contacto)"
        
    }
}