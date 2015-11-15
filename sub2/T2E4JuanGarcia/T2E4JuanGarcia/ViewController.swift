//
//  ViewController.swift
//  T2E4JuanGarcia
//
//  Created by jgd on 22/06/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        var aptitudes: NSMutableArray = ["Java","C++"]
        var c = Contacto(telefono: "555987654", direccion: "C/Falsa,123", email: "juangrdiaz@gmail.com", empresa: "Te")
        var p = Persona(edad: 26, altura: 1.80, nombre: "Juan", apellido:"Garcia", aptitudes:aptitudes, contacto:c)
        print(p)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

