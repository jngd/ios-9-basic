//
//  ViewController.swift
//  T16E3JuanGarcia
//
//  Created by jgd on 28/12/15.
//  Copyright © 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var celsius: UITextField!
  @IBOutlet weak var kelvin: UITextField!
  
  @IBOutlet weak var humedad: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var sessionConfig: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    
    sessionConfig.allowsCellularAccess = false
    sessionConfig.HTTPAdditionalHeaders = ["Accept":"application/json"]

    sessionConfig.timeoutIntervalForRequest = 30.0
    sessionConfig.timeoutIntervalForResource = 60.0
    sessionConfig.HTTPMaximumConnectionsPerHost = 1
    
    var session = NSURLSession(configuration: sessionConfig)
    session.dataTaskWithURL(NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=Madrid,es")!, completionHandler: {(data, response, error) in
    do {
      var dic: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as! NSDictionary
      print(dic)
      var humedad: AnyObject! = (dic["main"] as! NSDictionary)["humidity"]
      var kelvin: AnyObject! = (dic["main"] as! NSDictionary)["temp"]
      var celsius = self.kelvin as! Float - 274.15 as Float
      dispatch_async(dispatch_get_main_queue(), {() in
        self.kelvin.text = "\(kelvin)"
        self.celsius.text = "\(celsius)"
        self.humedad.text = "\(humedad)"})
        } catch _ {
        print("error")
      }
    }).resume()
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

