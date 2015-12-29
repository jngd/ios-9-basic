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
    var animation: CABasicAnimation! = CABasicAnimation(keyPath: "position")
    animation.toValue = NSValue(CGPoint:CGPointMake(160, 200))
    var resizeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "bounds.size")
    resizeAnimation.toValue = NSValue(CGSize: CGSizeMake(240, 60))
    
    image.layer.addAnimation(animation, forKey:"position")
    image.layer.addAnimation(resizeAnimation, forKey: "bounds.size")
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

