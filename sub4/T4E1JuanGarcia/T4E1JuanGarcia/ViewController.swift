//
//  ViewController.swift
//  T4E1JuanGarcia
//
//  Created by jgd on 11/07/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, myDelegate{

    override func viewDidLoad() {
        
        super.viewDidLoad()
        var myObject: MyObject = MyObject()
        myObject.delegate = self
        myObject.showNumbers()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func delegateMethod() {
        print("Object has showed numbers")
    }


}

