//
//  ViewController.swift
//  T6E2JuanGarcia
//
//  Created by jgd on 18/07/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!

    @IBAction func changeAlpha(sender: UISlider) {
        self.image.alpha = CGFloat(sender.value)
    }
    @IBAction func showImage(sender: UISwitch) {
        self.image.hidden = !sender.on
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

