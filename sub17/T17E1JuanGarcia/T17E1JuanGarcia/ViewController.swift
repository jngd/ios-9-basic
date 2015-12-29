//
//  ViewController.swift
//  T17E1JuanGarcia
//
//  Created by jgd on 28/12/15.
//  Copyright © 2015 jgd. All rights reserved.
//

import UIKit
import EventKitUI

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func viewDidAppear(animated: Bool) {
    var store = EKEventStore()
    store.requestAccessToEntityType(EKEntityType.Event) {(granted, error)
      in
      if granted {
        print("Granted")
      } else {
        print("Not granted")
      }
    }
    
    var controller = EKEventEditViewController()
    controller.eventStore = store
    self.presentViewController(controller, animated: true, completion: nil)
    

  }
}

// MARK: - EKEventEditViewDelegate

extension ViewController: EKEventEditViewDelegate {
  
  func eventEditViewController(controller: EKEventEditViewController, didCompleteWithAction action: EKEventEditViewAction) {
    // empty
  }
}

