//
//  ViewController.swift
//  T5E0JuanGarcia
//
//  Created by jgd on 13/07/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tag: UILabel!

    @IBAction func boton(sender: AnyObject) {

        print("hola")
        self.tag.text = "hola mundo"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

