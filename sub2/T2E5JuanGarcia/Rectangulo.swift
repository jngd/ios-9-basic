//
//  Rectangulo.swift
//  T2E5JuanGarcia
//
//  Created by jgd on 21/06/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

class Rectangulo : NSObject {
    var ladoA : Int
    var ladoB : Int
    var area: Int {
        get {
            return ladoA*ladoB
        }
    }
    
    init (ladoA:Int,ladoB:Int) {
    
        self.ladoA = ladoA
        self.ladoB = ladoB
    }
    override var description: String {
        
        return "El area es \(area)"
        
    }
}
