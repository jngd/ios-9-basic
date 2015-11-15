//
//  MyObject.swift
//  T4E1JuanGarcia
//
//  Created by jgd on 11/07/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

protocol myDelegate {
    func delegateMethod()
}

class MyObject: NSObject {
    var delegate: myDelegate?
    
    func showNumbers(){
        // Object show 1..100 numbers
        for index in 1...100 {
            print("\(index) ")
        }
        
        delegate?.delegateMethod()
    }
}
