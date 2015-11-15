//
//  ViewController.swift
//  T6E1JuanGarcia
//
//  Created by jgd on 18/07/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityImage: UIImageView!
    
    @IBAction func changeImage(sender: AnyObject) {
        
        switch(sender.tag){
        case 1:
            self.cityImage.image = UIImage(named: "ams")
            break
        case 2:
            self.cityImage.image = UIImage(named: "dub")
            break
        case 3:
            self.cityImage.image = UIImage(named: "lon")
            break
        default:
            break
        }
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

