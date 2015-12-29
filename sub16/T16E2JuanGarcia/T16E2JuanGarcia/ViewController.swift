//
//  ViewController.swift
//  T16E2JuanGarcia
//
//  Created by jgd on 28/12/15.
//  Copyright © 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var appTitle: UILabel!
  @IBOutlet weak var appDesc: UITextView!
  
  var dataJSON = NSMutableData()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  
    var stringURL = "https://itunes.apple.com/es/rss/topfreeapplications/limit=10/json"
    
    var url = NSURL(string: stringURL)
    
    var request = NSURLRequest(URL: url!)
    
    var connection: NSURLConnection? = NSURLConnection(request: request, delegate: self)
    
    if connection != nil {
      print("Connecting")
      dataJSON = NSMutableData()
    } else {
      print("Impossible to connect")
    }
    
    
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func connectionDidFinishLoading(connection: NSURLConnection) {
    var error: NSError?
    
    do {

      var dic: NSDictionary = try NSJSONSerialization.JSONObjectWithData(dataJSON, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
      
      var top1 = ((dic["feed"] as! NSDictionary) ["entry"]! as! NSArray)[0] as! NSDictionary
      var imgJson: AnyObject = (top1["im:image"] as! NSArray)[2]
      var url = NSURL(string: imgJson.objectForKey("label") as! String)
      var data = NSData(contentsOfURL: url!)
      var img = UIImage(data: data!)
      image.image = img
      var tit = (top1["title"] as! NSDictionary)["label"] as! NSString
      var desc = (top1["summary"] as! NSDictionary)["label"] as! NSString
      appTitle.text = tit as String
      appDesc.text = desc as String
    } catch _ {
      print("Error parsing json")
    }
  }


}

// MARK: - NSURLConnectionDelegate
extension ViewController: NSURLConnectionDelegate {
  
  func connection(connection: NSURLConnection!, didFailWithError error: NSError!) {
    print("Error \(error)")
  }
  
  func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse!) {
  
    print("Received response: \(response)")
    dataJSON.length = 0
  }
  
  func connection(connection: NSURLConnection, didReceiveData data: NSData!) {
    dataJSON.appendData(data)
  }
  
}
