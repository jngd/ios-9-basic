//
//  ViewController.swift
//  T18E3JuanGarcia
//
//  Created by jgd on 29/12/15.
//  Copyright © 2015 jgd. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

  @IBOutlet weak var gravityButton: UIButton!
  @IBOutlet weak var pushButton: UIButton!
  @IBOutlet weak var attachmentButton: UIButton!
  
  var animator = UIDynamicAnimator()
  
  @IBAction func gravityAction(sender: AnyObject) {
    animator.removeAllBehaviors()
    var gravity = UIGravityBehavior(items: [self.gravityButton, self.pushButton, self.attachmentButton])
    animator.addBehavior(gravity)
  
  }
  
  
  @IBOutlet weak var pushAction: UIButton!
  
  @IBAction func attachmentAction(sender: AnyObject) {
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    animator = UIDynamicAnimator(referenceView: self.view)
  }

  override func viewDidAppear(animated: Bool) {
    var max: CGRect = UIScreen.mainScreen().bounds
    var snap1 = UISnapBehavior(item: self.gravityButton, snapToPoint: CGPointMake(max.size.width/2, max.size.height/2 - 50))
    var snap2 = UISnapBehavior(item: self.pushButton, snapToPoint: CGPointMake(max.size.width/2, max.size.height/2))
    var snap3 = UISnapBehavior(item: self.attachmentButton, snapToPoint: CGPointMake(max.size.width/2, max.size.height/2 + 50))
    
    snap1.damping = 1
    snap2.damping = 2
    snap3.damping = 4
    
    animator.addBehavior(snap1)
    animator.addBehavior(snap2)
    animator.addBehavior(snap3)
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

