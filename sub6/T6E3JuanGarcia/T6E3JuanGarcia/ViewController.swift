//
//  ViewController.swift
//  T6E3JuanGarcia
//
//  Created by jgd on 18/07/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderR: UISlider!
    @IBOutlet weak var sliderG: UISlider!
    @IBOutlet weak var sliderB: UISlider!

    
    @IBAction func changeColoer(sender: UISlider) {
        
        self.view.tintColor = UIColor(red: CGFloat(self.sliderR.value), green: CGFloat(self.sliderG.value), blue: CGFloat(self.sliderB.value), alpha: 1.0)
        self.vista.backgroundColor = UIColor(red: CGFloat(self.sliderR.value), green: CGFloat(self.sliderG.value), blue: CGFloat(self.sliderB.value), alpha: 1.0)
    }
    @IBOutlet weak var vista: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

