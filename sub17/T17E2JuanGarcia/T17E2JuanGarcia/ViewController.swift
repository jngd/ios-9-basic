//
//  ViewController.swift
//  T17E2JuanGarcia
//
//  Created by jgd on 29/12/15.
//  Copyright © 2015 jgd. All rights reserved.
//

import UIKit
import Social
import Accounts




class ViewController: UIViewController {
  
  @IBOutlet weak var twitterButton: UIButton!

  @IBOutlet weak var facebookButton: UIButton!

  @IBAction func msgTwitter(sender: AnyObject) {
    var twitterController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
    twitterController.setInitialText("")
    twitterController.addImage(UIImage(named: "im1.jpeg"))
    var completionHandler = {(result:SLComposeViewControllerResult) -> () in
      twitterController.dismissViewControllerAnimated(true, completion: nil)
      switch result {
      case SLComposeViewControllerResult.Cancelled:
        print("User cancel action")
      case SLComposeViewControllerResult.Done:
        print("User post successfully")
      default:
        break
      }
      
    }
    twitterController.completionHandler = completionHandler
    self.presentViewController(twitterController, animated: true, completion: nil)
  }
  
  @IBAction func msgFB(sender: AnyObject) {
    var fbController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
    fbController.setInitialText("")
    fbController.addURL(NSURL(string: "https://www.google.es"))
    var completionHandler = {(result:SLComposeViewControllerResult) -> () in
      fbController.dismissViewControllerAnimated(true, completion: nil)
      switch result {
      case SLComposeViewControllerResult.Cancelled:
        print("User cancel action")
      case SLComposeViewControllerResult.Done:
        print("User post successfully")
      default:
        break
      }
    
    }
    fbController.completionHandler = completionHandler
    self.presentViewController(fbController, animated: true, completion: nil)
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

