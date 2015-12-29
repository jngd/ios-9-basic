//
//  ViewController.swift
//  T16E4JuanGarcia
//
//  Created by jgd on 28/12/15.
//  Copyright © 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var session = NSURLSession()
  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var progressBar: UIProgressView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
    session = NSURLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
    load()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func load() {
    var imageURL : String = "http://www.imaginagroup.com/images/cronologia_apps/logo-imagina-formacion.png"
    
    var getImageTask: NSURLSessionDownloadTask = session.downloadTaskWithURL(NSURL(string: imageURL)!)
    getImageTask.resume()
  }
  
}

extension ViewController: NSURLSessionDownloadDelegate {
  
  func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
    print("Download finished")
    var downloadedImage = UIImage(data: NSData(contentsOfURL: location)!)
      dispatch_async(dispatch_get_main_queue(), {() in
        self.image.image = downloadedImage})
  }
  
  
  func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
    dispatch_async(dispatch_get_main_queue(), {() in
      var variable = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
      self.progressBar.progress = variable
    })
  }
}
