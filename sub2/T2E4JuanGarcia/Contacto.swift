//
//  Contacto.swift
//  T2E4JuanGarcia
//
//  Created by jgd on 22/06/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

class Contacto: NSObject {
    
    var telefono: NSString
    var direccion: NSString
    var email: NSString
    var empresa:NSString
    
    init(telefono:NSString, direccion:NSString, email:NSString, empresa:NSString)
    {
        self.telefono = telefono
        self.direccion = direccion
        self.email = email
        self.empresa = empresa
    }
    
    override var description: String {
        
        return "Teléfono: \(telefono) \n" +
        "Direccion: \(direccion) \n" +
        "Email: \(email) \n" +
        "Empresa: \(empresa) \n"
        
    }
    
   
}
