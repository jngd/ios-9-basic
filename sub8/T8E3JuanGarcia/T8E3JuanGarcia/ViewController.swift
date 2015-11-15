//
//  ViewController.swift
//  T8E3JuanGarcia
//
//  Created by jgd on 19/07/15.
//  Copyright (c) 2015 jgd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var netRotation:CGFloat = 0
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        var rotateGesture = UIRotationGestureRecognizer(target: self, action: "rotateGesture:")
        var swipeGesture = UISwipeGestureRecognizer(target: self, action: "swipeGesture:")
        var longPress = UILongPressGestureRecognizer(target: self, action: "showAlert:")
        image.addGestureRecognizer(rotateGesture)
        image.addGestureRecognizer(swipeGesture)
        image.addGestureRecognizer(longPress)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func rotateGesture(sender: UIRotationGestureRecognizer){
        print("Rotating")
        
        var rotation:CGFloat = sender.rotation
        
        var transform:CGAffineTransform  =
        CGAffineTransformMakeRotation(rotation + netRotation)
        sender.view?.transform = transform
        if (sender.state == UIGestureRecognizerState.Ended){
            netRotation += rotation;
        }
    }
    
    @IBAction func swipeGesture(sender: UISwipeGestureRecognizer){
            print("Swiping")
            
            self.image.image = UIImage(named: "ams")
          
            
    }
    
    @IBAction func showAlert(sender: UILongPressGestureRecognizer){
    
            var alert = UIAlertController(title: "Alert", message: "Long press detected", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
    
                
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

