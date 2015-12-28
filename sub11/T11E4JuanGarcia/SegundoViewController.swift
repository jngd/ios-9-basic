//
//  SegundoViewController.swift
//  T11E4JuanGarcia
//
//  Created by jgd on 26/07/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

protocol miDelegate{
    func escribirDatoEnLabe(dato: String)
}

class SegundoViewController: UIViewController {

    var delegate: miDelegate?
    var datos: String = ""
    @IBOutlet weak var segundoLabel: UILabel!
    
    @IBAction func segundoButton(sender: AnyObject) {

        self.delegate?.escribirDatoEnLabe("¡Conseguido!")
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segundoLabel.text = datos

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
