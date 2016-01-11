//
//  ViewController.swift
//  T18E1JuanGarcia
//
//  Created by jgd on 29/12/15.
//  Copyright © 2015 jgd. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var animateButton: UIButton!
  
  @IBAction func animateAction(sender: AnyObject) {
    
    UIView.animateWithDuration(5.0, delay: 0.0, options: UIViewAnimationOptions.BeginFromCurrentState, animations:{
      self.image.alpha = 0.0
      self.image.alpha = 1.0
      
      self.image.frame = CGRect(x: 160, y: 200, width: self.image.frame.size.width, height: self.image.frame.size.height)
      
    }, completion: {(value: Bool) in
      print("Animation finished")
    })
    
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

