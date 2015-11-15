//
//  ViewController.swift
//  T5E3JuanGarcia
//
//  Created by jgd on 13/07/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var apellidos: UITextField!
    @IBOutlet weak var direccion: UITextField!
    
    @IBOutlet weak var text: UITextView!
    @IBAction func mostrar(sender : AnyObject) {
        let texto: String = "Me llamo \(nombre.text) \(apellidos.text) y vivo en la direccion \(direccion.text)"
        text.text = texto
    }
    
    @IBAction func esconderTeclado(sender : AnyObject) {
        
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

