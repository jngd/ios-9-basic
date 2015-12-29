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
    var animation: CABasicAnimation = CABasicAnimation(keyPath: "position")
    animation.fromValue = NSValue(CGPoint:CGPointMake(image.frame.midX, image.frame.midY))
    animation.toValue = NSValue(CGPoint:CGPointMake(image.frame.midX, 340))
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    animation.duration = 1.0
    image.layer.addAnimation(animation, forKey:"position")
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

