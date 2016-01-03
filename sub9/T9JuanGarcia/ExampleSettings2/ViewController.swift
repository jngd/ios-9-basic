//
//  ViewController.swift
//  ExampleSettings2
//
//  Created by jgd on 30/12/15.
//  Copyright © 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
  @IBOutlet weak var button1: UIButton!
  
  
  @IBOutlet weak var button2: UIButton!
  
  
  @IBOutlet weak var button3: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var defaults : NSUserDefaults
    var appExecutions : Int
    var dateOfLastExecution : String
    var enableButtons : Bool
    

    defaults = NSUserDefaults.standardUserDefaults()
    appExecutions = defaults.integerForKey("app_executions")
    enableButtons = defaults.boolForKey("enabled_buttons")
    
    if (enableButtons) {
      print("All buttons are enabled")
      button1.hidden = false
      button2.hidden = false
      button3.hidden = false
    } else {
      print("All buttons are disabled")
      button1.hidden = true
      button2.hidden = true
      button3.hidden = true
    }
    
    if (appExecutions == 0) {
      defaults.setObject(++appExecutions, forKey: "app_executions")
      defaults.setObject(getDate(), forKey: "last_execution")
      print("First execution")
    } else {
      print("Not first execution")
      print("App executions \(appExecutions)")
      dateOfLastExecution = defaults.valueForKey("last_execution") as! String
      print("Date of last execution \(dateOfLastExecution)")
      ++appExecutions
      defaults.setValue(appExecutions, forKey: "app_executions")
      defaults.setValue(getDate(), forKey: "last_execution")
    }

    defaults.synchronize()
  }
  
  
  func getDate() -> String {
    let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)

    return timestamp
  }

  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

