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
    
    // Ampliación 1
    let startDate : NSDate = NSDate(dateString: "2013-01-01")
    let endDate : NSDate = NSDate(dateString: "2013-01-02")
    let predicate : NSPredicate = store.predicateForEventsWithStartDate(startDate, endDate: endDate, calendars: nil)
    
    let eventsToRemove : NSArray = store.eventsMatchingPredicate(predicate)
    
    if eventsToRemove.count == 0 {
      print ("Any events to remove")
    } else {
      for i in eventsToRemove {
        do{
          try store.removeEvent(i as! EKEvent, span: EKSpan.ThisEvent)
        } catch _ {
          print("Error removing events")
        }
      }
    }
    
    // Ampliacion 2
    let startDateToAddAlarm : NSDate = NSDate(dateString: "2015-01-01")
    let endDateToAddAlarm : NSDate = NSDate(dateString: "2016-01-1")
    let predicateToAddAlarm : NSPredicate = store.predicateForEventsWithStartDate(startDateToAddAlarm, endDate: endDateToAddAlarm, calendars: nil)
    
    let eventsToAddAlarm : NSArray = store.eventsMatchingPredicate(predicateToAddAlarm)
    var alarm:EKAlarm = EKAlarm(relativeOffset: -60)

    if eventsToRemove.count == 0 {
      print ("Any events to add alarm")
    } else {
      for i in eventsToAddAlarm {
        (i as! EKEvent).addAlarm(alarm)
      }
    }
    
    
    var controller = EKEventEditViewController()
    controller.eventStore = store
    self.presentViewController(controller, animated: true, completion: nil)
    

  }
}

extension NSDate
{
  convenience
  init(dateString:String) {
    let dateStringFormatter = NSDateFormatter()
    dateStringFormatter.dateFormat = "yyyy-MM-dd"
    dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    let d = dateStringFormatter.dateFromString(dateString)!
    self.init(timeInterval:0, sinceDate:d)
  }
}

// MARK: - EKEventEditViewDelegate

extension ViewController: EKEventEditViewDelegate {
  
  func eventEditViewController(controller: EKEventEditViewController, didCompleteWithAction action: EKEventEditViewAction) {
    // empty
  }
}

