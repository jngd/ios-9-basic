//
//  ViewController.swift
//  T11E4JuanGarcia
//
//  Created by jgd on 26/07/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, miDelegate {


    @IBOutlet weak var labelPrincipal: UILabel!
    
    
    @IBAction func buttonPrincipal(sender: AnyObject) {
        
        // Get the second view controller
        var segundoController:SegundoViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SegundoViewController") as! SegundoViewController
        segundoController.datos = "Texto en el padre"
        segundoController.delegate = self
        self.navigationController?.pushViewController(segundoController, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func escribirDatoEnLabe(dato: String){
        self.labelPrincipal.text = dato
    }

}

